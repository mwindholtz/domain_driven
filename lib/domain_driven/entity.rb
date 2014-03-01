# Thanks to Jim Weirich for the concepts in this class. 
# Extracted from https://github.com/jimweirich/wyriki
# domain_driven would not be possible without this critical part.

require 'delegate'

module DomainDriven
  class Entity < SimpleDelegator
    include BlockActiveRecord

    def _data
      datum = self
      while datum.entity?
        datum = datum.__getobj__
      end
      datum
    end

    def ==(other)
      if other.respond_to?(:_data)
        _data == other._data
      else
        _data == other
      end
    end

    def entity?
      true
    end

    def class
      _data.class
    end

    def self.wrap(entity)
      entity ? new(entity) : nil
    end

    def self.wraps(entities)
      return entities unless entities
      entities.map { |entity| wrap(entity) }
    end

  end
end

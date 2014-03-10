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
      return nil unless entities
      wrap(entities.extend Model).extend Collection # FIXME needs to provide the Entity type somehow
    end

  end

  module Collection
    def each
      _data.each do |_item|
        yield wrap(_item)    # FIXME  fails.
      end
    end

    def include?(other)
      if other.respond_to?(:_data)
        _data.include?(other._data)
      else
        _data.include?(other)
      end
    end
  end

end

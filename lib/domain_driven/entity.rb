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
                   
    alias :_real_class :class
    def class
      _data.class
    end
    
    def self.wrap(a_model)
      a_model ? new(a_model) : nil
    end

    def self.wraps(models)
      return nil unless models
      wrap(models.extend Model).extend Collection 
    end

  end

  module Collection
    def each
      _data.each do |_item|
        yield self._real_class.wrap(_item) 
      end
    end

    def to_a
      _data.inject([]) do |array, _item|
        array << self._real_class.wrap(_item)
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

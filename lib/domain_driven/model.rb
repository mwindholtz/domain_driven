# Thanks to Jim Weirich for the concepts in this class.
# Extracted from https://github.com/jimweirich/wyriki
# domain_driven would not be possible without this critical part.

module DomainDriven

  # Include in ActiveRecord models to mimic Entity models.
  module Model
    def _data
      self
    end

    def entity?
      false
    end

    def ==(other)
      if other.respond_to?(:entity?) && other.entity?
        self == other._data
      else
        super
      end
    end

    module ClassMethods

      def find(*)
        super
      rescue ActiveRecord::RecordNotFound  => error
        raise DomainDriven::RecordNotFound.new(error)
      rescue => error
        raise DomainDriven::Error.new(error)
      end

    end # ClassMethods


    def self.included(klass)
      super
      klass.extend ClassMethods
    end

  end

end

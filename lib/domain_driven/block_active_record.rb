# Thanks to Jim Weirich for the concepts in this class. 
# Extracted from https://github.com/jimweirich/wyriki
# domain_driven would not be possible without this critical part.

module DomainDriven

  ActiveRecordNotAvailableError = Class.new(StandardError)

  # Include this module to block ActiveRecord save/update_attributes
  # calls on the object.
  module BlockActiveRecord
    def save
      no_db_methods
    end

    def save!
      no_db_methods
    end

    def update_attribute(*args)
      no_db_methods
    end

    def update_attribute!(*args)
      no_db_methods
    end

    def update_attributes(*args)
      no_db_methods
    end

    def update_attributes!(*args)
      no_db_methods
    end

    private

    def no_db_methods
      fail ActiveRecordNotAvailableError, "No DB methods on Business Objects"
    end
  end
end

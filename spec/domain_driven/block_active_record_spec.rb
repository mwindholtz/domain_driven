require 'spec_helper'

class EntityUnderTest < DomainDriven::Entity
end
  
class RaiseEverything
  def method_missing(name,*args)
    raise "RaiseEverything should never receieve any message"
  end
end

describe 'Entity' do

  Given! (:model)   { RaiseEverything.new }
  Given! (:entity)  { EntityUnderTest.new(model) }
  
  context 'attempting to call active_record methods should not delegate to the model: ' do
  
    context "save"  do
      When(:result) { entity.save }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end

    context "save!"  do
      When(:result) { entity.save! }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end

    context "update_attribute"  do
      When(:result) { entity.update_attribute }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end

    context "update_attribute!"  do
      When(:result) { entity.update_attribute! }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end

    context "update_attributes"  do
      When(:result) { entity.update_attributes }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end

    context "update_attributes!"  do
      When(:result) { entity.update_attributes! }
      Then { expect(result).to have_failed(DomainDriven::ActiveRecordNotAvailableError) }
    end


  end
end
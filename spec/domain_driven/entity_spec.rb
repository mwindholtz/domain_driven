require 'spec_helper'

class EntityUnderTest < DomainDriven::Entity
end
                                                             
class FakeModel
  include DomainDriven::Model
  def course_type; 'A'; end
end
  
describe 'Entity' do

  Given! (:model)   { FakeModel.new  }  
  Given! (:entity)  { EntityUnderTest.new(model) }
  
  context 'has model as _data ' do  
    Then { entity.entity?.should == true }    
    Then { entity._data.entity?.should == false }    
    Then { entity._data.should == model}    
  end 

  context 'same as  _data ' do  
    Then { entity._data == entity}    
  end 

  context 'same as self' do  
    Then { entity == entity}    
  end 

  context 'class name' do 
    context 'wrap same class as model' do 
      Then { entity.class.to_s == "FakeModel" }  
    end 

    context 'wrap nil is still nil' do  
      When(:entity)  { EntityUnderTest.wrap(nil)  }
      Then { entity.class.to_s == "NilClass"}   
    end 

    context 'wraps nil is still nil' do  
      When(:entity_list)  { EntityUnderTest.wraps(nil)  }
      Then { entity_list.class.to_s == "NilClass"}   
    end 

    context 'class wraps a set of models' do  
      When(:entity_list)  { EntityUnderTest.wraps( [model, model])  }
      Then { entity_list.class.to_s == "Array"}   
    end 

    context 'class wraps each model ina a set of models' do  
      When(:entity_list)  { EntityUnderTest.wraps( [model, model])  }
      Then { entity_list.first.class.to_s == "FakeModel"}   
##     Then { entity_list.each{|e| e.entity?.should be_true }}    # FIXME
    end 

  end 
  
  def self.wrap(entity)
    entity ? new(entity) : nil
  end
  

end
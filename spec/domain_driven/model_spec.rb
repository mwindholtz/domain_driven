require 'spec_helper'
  
describe 'Model' do

  Given! (:model)   { FakeModel.new  }  

  Then { model._data === model }
  Then { model.entity? == false }
  
  
  context "find"  do
    When(:result) { FakeModel.find('ignore') }
    Then { expect(result).to have_failed( DomainDriven::RecordNotFound, 'clever message' ) }
  end
     
  
end

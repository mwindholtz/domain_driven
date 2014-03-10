require 'spec_helper'

class FakeService < DomainDriven::Service
  def perform_main
  end
  
end
  
describe 'Service' do

  When(:result) { FakeService.perform({}) }
  Then { result }

end

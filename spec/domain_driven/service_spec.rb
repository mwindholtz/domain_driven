require 'spec_helper'
require 'logger'

class FakeService < DomainDriven::Service
  def perform_main
    context[:course] = 'Its a horse-course of course'
  end
  
end
  
describe 'Service' do

  When(:result) { FakeService.perform(request: {id: 123},  current_member: 'a-user', 
                                                           page_param: 1, 
                                                           logger: Logger.new($stdout)) }
  Then { result.context[:course] == 'Its a horse-course of course' }
  Then { result.context[:request][:id] == 123 }

end

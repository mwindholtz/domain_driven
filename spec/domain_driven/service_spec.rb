require 'spec_helper'
require 'logger'

class FakeService < DomainDriven::Service
  def perform_main
    context[:course] = 'Its a horse-course of course'
  end
  
end
  
describe 'Service' do
 
  context 'performing' do
    When(:result) { FakeService.perform(request: {id: 123},  current_member: 'a-user', 
                                                             page_param: 1, 
                                                             logger: Logger.new($stdout)) }
    Then { result.context[:course] == 'Its a horse-course of course' }
    Then { result.context[:request][:id] == 123 }
  end
  
  context 'repository exists' do
       
    Given(:repo) { DomainDriven::Service::Repo }
    Given        { repo.logger = FastSpecLogger.instance }


    context 'lookup  by string class name' do
      Given { repo.factory  = { course:   'FakeRepository' } }
    
      context 'direct lookup ' do
        When(:result)  { repo.for(:course) }   
        Then { result.class.should == FakeRepository }
      end

      context 'method_missing lookup ' do
        When(:result)  { repo.for_course }   
        Then { result.class.should == FakeRepository }
      end
    end

    context 'lookup by symbol' do
      Given { repo.factory  = { course:   :fake_repository } }
      When(:result)  { repo.for(:course) }   
      Then { result.class.should == FakeRepository }
    end

    context 'lookup by lowercase string' do
      Given { repo.factory  = { course:   'fake_repository' } }
      When(:result)  { repo.for(:course) }  
      Then { result.class.should == FakeRepository } 
    end

  end


end

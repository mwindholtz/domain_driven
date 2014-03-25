require 'spec_helper'

class RepositoryUnderTest  
  include DomainDriven::Repository
end
  
describe 'Repository' do

  Given! (:repository)   { RepositoryUnderTest.new(:fake_repo)  }  

  Then { repository.to_s == 'fake_repo'}  
end

require 'spec_helper'
  
describe 'Repository' do

  Given! (:repository)   { RepositoryUnderTest.new(:fake_repo)  }  

  Then { repository.to_s == 'fake_repo'}  
end

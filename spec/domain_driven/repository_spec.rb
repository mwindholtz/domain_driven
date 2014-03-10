require 'spec_helper'
  
describe 'Repository' do

  Given! (:repository)   { DomainDriven::Repository.new(:fake_repo)  }  

  Then { repository.to_s == 'fake_repo'}  
end

require 'spec_helper'

describe 'Criteria' do

  Given! (:criteria)  { DomainDriven::Criteria.new }

  context "empty criteria has no effect" do
    Then { criteria.display_chain.should eq("")}

    context "send_to" do
      Given(:target) { 'hello' }
      When(:result)  { criteria.send_to(target) }
      Then           { result.should eq('hello') }  
    end    
  end      
  
  context "send #where" do
    Given(:email)  { 'todd@example.com' }
    When           { criteria.where("email='#{email}'") }
    Then           { criteria.display_chain.should eq("where email='#{email}'") }
  end

  context "send #load" do
    When(:result) { criteria.load }
    Then          { criteria.display_chain.should eq("load ") }
    # Then      { expect(result).to have_failed(ArgumentError, /wrong number of arguments/) }
  end

  context "send #reverse " do
    When            { criteria.reverse }
    Then            { criteria.display_chain.should eq("reverse ")}

    context "send_to" do
      Given(:target) { '123456' }
      When(:result)  { criteria.send_to(target) }
      Then           { result.should eq('654321') }  
    end  
  end      

  context "send #chomp with arugment " do
    Whereas         { criteria.chomp("llo") }
    Then            { criteria.display_chain.should eq("chomp llo") }

    context "send_to" do
      Given(:target)    { 'hello' }
      Whereas(:result)  { criteria.send_to(target) }
      Then              { result.should eq('he') }   
      
      context "send a second message" do 
        Given            { criteria.add('+', " is great" ) }
        Then             { criteria.display_chain.should eq("chomp llo, +  is great")}
        Whereas(:result) { criteria.send_to(target) }
        Then             { result.should eq('he is great') }   
      end
      
      context "send a second message with syntactic sugar" do 
        Given            { criteria + " is great"  }
        Then             { criteria.display_chain.should eq("chomp llo, +  is great")}
        Whereas(:result) { criteria.send_to(target) }
        Then             { result.should eq('he is great') }   
      end
      
    end    
  end      
    
end
require 'rubygems'
require 'rspec-given'
require 'domain_driven'
require 'ostruct'

module ActiveRecord 
  class RecordNotFound  < StandardError 
  end
end

class FakeBaseModel 
  def self.find(*)
    raise(ActiveRecord::RecordNotFound.new('clever message')) 
  end
end       

class FakeModel < FakeBaseModel 
  include DomainDriven::Model
  def course_type; 'A'; end
end

module Given  
  module ClassExtensions
    alias Whereas Given 
    alias Whereas! Given! 
  end
end

require 'rubygems'
require 'rspec-given'
require 'domain_driven'
require 'ostruct'

module ActiveRecord 
  class RecordNotFound  < StandardError 
  end
end

class RepositoryUnderTest  
  include DomainDriven::Repository
end

class FakeRepository
  include DomainDriven::Repository
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

class FastSpecLogger 
  def self.instance
    @instance ||= FastSpecLogger.new
  end
  
  def initialize; @last_error = ''; end
  def error(value); @last_error = value; end
  def info(value); @last_error = value; end
end

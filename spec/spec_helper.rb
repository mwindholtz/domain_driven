require 'rubygems'
require 'rspec-given'
require 'domain_driven'
require 'ostruct'

module Given  
  module ClassExtensions
    alias Whereas Given 
    alias Whereas! Given! 
  end
end

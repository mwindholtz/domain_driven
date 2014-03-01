require 'rubygems'
require 'rspec-given'
require 'domain_driven'

module Given  
  module ClassExtensions
    alias Whereas Given 
    alias Whereas! Given! 
  end
end

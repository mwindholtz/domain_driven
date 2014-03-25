require 'logger'

module DomainDriven
  module Repository
    attr_accessor :logger
    def to_s
      "#{@name}"
    end
 
    module ClassMethods
    end
  
    protected
      def initialize(name)
        @name   = name
        self.logger = Logger.new(STDOUT)
      end

      def self.included(klass)
        super
        klass.extend ClassMethods
      end
  end
end

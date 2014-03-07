class DomainDriven::Repository
  attr_accessor :logger

  protected
    def initialize(name)
      @name   = name
      self.logger = Logger.new(STDOUT)
    end
    
end

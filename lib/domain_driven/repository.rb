class DomainDriven::Repository
   
  protected
    def initialize(name, logger)
      @name   = name
      @logger = logger
    end
    
    def logger; @logger; end
      
end

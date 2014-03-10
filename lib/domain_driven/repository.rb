require 'logger'

class DomainDriven::Repository
  attr_accessor :logger
  def to_s
    "#{@name}"
  end

  protected
    def initialize(name)
      @name   = name
      self.logger = Logger.new(STDOUT)
    end
                    
end

module DomainDriven
  
  class Message
    def initialize(name, args=nil)
      @name, @args = name, args
    end

    def to_s
      "#{@name} #{@args}"
    end
    
    def sendable
      if @args
        [@name.to_sym, @args]
      else
        @name.to_sym
      end
    end
  end

  class Criteria 
  
    def initialize()
      @chain = []
    end
  
    # sugar
    def add(name, *args)
      add_message(DomainDriven::Message.new(name, *args))
    end
    
    def display_chain
      @chain.map(&:to_s).join(', ')
    end

    def send_to(target)   
      @chain.each do |e| 
        target = target.send(*(e.sendable))
      end      
      target
    end  
    
    def method_missing(sym, *args, &block)
      self.add(sym.to_sym, *args)  
    end
     
    # override Kernal.load
    def load
      self.add(:load)  
    end

    def find(*)
      raise "not supported"  
    end
    
    private 
      def add_message(message)
        @chain << message 
      end
      
  end  
    
end
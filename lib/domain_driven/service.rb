require "interactor"
require "pundit"

module DomainDriven
  class Service
    include Interactor
    include Pundit

    def perform
      perform_main
    rescue DomainDriven::RecordNotFound
      raise
    rescue Pundit::NotAuthorizedError
      raise
    end

    module Repo  # this is the Repository Factory
      module_function  

      class << self
        attr_writer :logger, :factory
      end

      def logger 
        @logger ||= Logger.new(STDOUT)
      end

      def factory
        return @factory if @factory
        raise "Repo has no factory initialized.  Add an intializer file with something like this: DomainDriven::Service::Repo.factory = { course:  CourseRepository, ...}" 
      end

      def for(name) 
        logger.info("Provisioning Repo #{name}")
        if repo_class_name = factory[name]
          repo_class = repo_class_name.to_s.classify.constantize 
          repo = repo_class.new(name) 
          repo
        else
          raise "repository not found: (#{name})"
        end
      end 
      
      
      def method_missing(name,*args)
        if name.to_s[0...4] == 'for_'
          self.for(name.to_s[4..-1].to_sym)
        else
          super
        end
      end

    end  # module Repo 

    protected
      def current_user
        context[:current_member]
      end

      def request
        context[:request]
      end

      def criteria
        context[:criteria] || DomainDriven::Criteria.new
      end

      def perform_main
        raise "subclass responsibility for #{self.class} "
      end

      def perform_rescue(x)
        context[:errors] = x.message
        context.fail!
      end

  end # class Service


  class ServiceOrganizer
    include Interactor::Organizer    
  end # 
    
end

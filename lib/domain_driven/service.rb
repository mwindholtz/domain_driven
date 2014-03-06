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
    # rescue => x
    #   perform_rescue(x)
    end

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

  end

end

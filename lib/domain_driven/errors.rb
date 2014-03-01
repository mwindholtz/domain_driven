module DomainDriven
  class Error < StandardError; end
  class RecordNotFound < StandardError; end
  class NotAuthorizedError < StandardError; end
end

module Basilik
  module Errors
    class NoDataError           < RuntimeError; end
    class InvalidRequestError   < RuntimeError; end
    class InvalidJSONError      < RuntimeError; end
    class PermissionDeniedError < RuntimeError; end
    class NonNumericFieldError  < RuntimeError; end
  end
end
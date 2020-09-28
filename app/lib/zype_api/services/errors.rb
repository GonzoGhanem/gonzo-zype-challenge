module ZypeApi
  module Services
    module Errors
      class BasicError < StandardError; end
      class Unauthorized < StandardError; end
    end
  end
end

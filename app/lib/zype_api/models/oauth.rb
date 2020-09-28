module ZypeApi
  module Models
    class Oauth < Base
      attr_reader :access_token,
                  :expires_at,
                  :refresh_token,
                  :consumer_id

      def initialize(params)
        @access_token = params['access_token']
        @refresh_token = params['refresh_token']
        @expires_at = Time.now.to_i + params['expires_in'].to_i
      end

      def expired?
        Time.now.to_i < expires_at
      end

    end
  end
end

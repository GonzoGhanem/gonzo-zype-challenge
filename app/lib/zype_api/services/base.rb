require 'uri'
require 'net/http'

module ZypeApi
  module Services
    class Base
      class << self
        def api_request(path, method: :get, params: {})
          url = URI("#{base_url}#{path}")
          url.query = params.map { |k, v| "#{k}=#{v}" }.join('&')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          request = "Net::HTTP::#{method.to_s.capitalize}".safe_constantize.new(url)
          response = http.request(request)

          parsed_response_body = JSON.parse(response.read_body.to_s)

          return parsed_response_body if response.code.to_i == 200

          ## Looks like 422 is used instead of 401
          exception_klass = response.code.to_i == 422 ? Errors::Unauthorized : Errors::BasicError
          raise exception_klass, parsed_response_body['message']
        rescue JSON::ParserError
          raise Errors::BasicError, 'Invalid response'
        end

        def app_key
          Rails.configuration.x.zype_api_app_key
        end

        def base_url
          'https://api.zype.com/'
        end

        def embeded_player_url(id)
          "https://player.zype.com/embed/#{id}.js?autoplay=true&app_key=#{app_key}"
        end
      end
    end
  end
end

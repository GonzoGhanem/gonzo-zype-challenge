module ZypeApi
  module Services
    class Oauth < Base
      class << self
        def authenticate(email, password)
          response = api_request('/oauth/token',
                                 method: :post,
                                 params: {
                                   username: email,
                                   password: password,
                                   client_id: client_id,
                                   client_secret: client_secret,
                                   grant_type: 'password'
                                 })

          ZypeApi::Models::Oauth.new(response)
        end

        def refresh(refresh_token)
          response = api_request('/oauth/token',
                                 method: :post,
                                 params: {
                                   refresh_token: refresh_token,
                                   client_id: client_id,
                                   client_secret: client_secret,
                                   grant_type: 'refresh_token'
                                 })

          ZypeApi::Models::Oauth.new(response)
        end

        def base_url
          'https://login.zype.com/'
        end

        def client_id
          Rails.configuration.x.zype_api_client_id
        end

        def client_secret
          Rails.configuration.x.zype_api_client_secret
        end
      end
    end
  end
end

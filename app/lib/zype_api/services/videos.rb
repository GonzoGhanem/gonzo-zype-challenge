module ZypeApi
  module Services
    class Videos < Base
      class << self
        def page(page_number = 1)
          ZypeApi::Models::VideoSearchResult.new.tap do |search_result|
            response = api_request('/videos', params: { app_key: app_key, page: page_number, per_page: 12 })

            search_result.videos = response['response'].map do |video|
              ZypeApi::Models::Video.new(video)
            end

            search_result.pagination = ZypeApi::Models::Pagination.new(response['pagination'])
          end
        end

        def get(video_id)
          video = api_request("/videos/#{video_id}", params: { app_key: app_key })['response']
          video['embeded_player_url'] = embeded_player_url(video_id)
          ZypeApi::Models::Video.new(video)
        end

        def customer_entitled_for?(video_id, access_token)
          response = api_request("/videos/#{video_id}/entitled", params: { access_token: access_token })
          response['message'].to_s.upcase == 'ENTITLED'
        rescue ZypeApi::Services::Errors::Unauthorized
          return false
        end
      end
    end
  end
end

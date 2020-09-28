module ZypeApi
  module Models
    class Video < Base
      attr_reader :xid,
                  :title,
                  :thumbnail_url,
                  :embeded_player_url,
                  :subscription_required

      def initialize(params)
        @xid = params['_id']
        @title = params['title']
        @thumbnail_url = params.dig('thumbnails', 0, 'url')
        @embeded_player_url = params['embeded_player_url']
        @subscription_required = params['subscription_required']
      end

      def free_to_play?
        !subscription_required
      end
    end
  end
end

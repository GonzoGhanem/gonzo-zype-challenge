class Video

  attr_reader :xid, :title, :thumbnail_url, :embeded_player_url

  def initialize(params)
    @xid = params['_id']
    @title = params['title']
    @thumbnail_url = params.dig('thumbnails',0,'url')
    @embeded_player_url = params['embeded_player_url']
  end 
end
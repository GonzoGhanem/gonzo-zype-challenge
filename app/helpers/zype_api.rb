require 'uri'
require 'net/http'

module ZypeApi

  def list_videos
    perform_request('/videos')['response']
  end

  def video_details(video_id)
    perform_request("/videos/#{video_id}")['response']
  end

  private

  def perform_request(path, params = {})
    params.merge!({app_key: app_key})
    url = URI("#{base_url}#{path}")
    url.query = params.map{|k,v| "#{k}=#{v}"}.join('&')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)

    JSON.parse(http.request(request).read_body)
  end

  def app_key
    Rails.configuration.zype_api_key
  end

  def base_url
    "https://api.zype.com/"
  end
end
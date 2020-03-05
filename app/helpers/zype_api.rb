require 'uri'
require 'net/http'

module ZypeApi

  def videos_page(page_number = 1)
    perform_request('/videos', {page: page_number, per_page: 12})
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
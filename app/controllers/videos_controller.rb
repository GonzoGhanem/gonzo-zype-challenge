class VideosController < ApplicationController

  include ZypeApi

  def index
    result = videos_page(page_number)
    @videos = result['response']
    @pagination = result['pagination']
  end

  def show
    @video = video_details(params[:id])
  end


  private

  def page_number
    params[:page] || 1
  end
end
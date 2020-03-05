class VideosController < ApplicationController

  include ZypeApi

  def index
    @data = videos_page(page_number)
  end

  def show
    @video = video_details(params[:id])
  end


  private

  def page_number
    params[:page] || 1
  end
end
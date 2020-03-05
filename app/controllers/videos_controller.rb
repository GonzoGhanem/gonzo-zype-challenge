class VideosController < ApplicationController

  include ZypeApi

  def index
    @videos = list_videos
  end

  def show
    @video = video_details(params[:id])
  end

end
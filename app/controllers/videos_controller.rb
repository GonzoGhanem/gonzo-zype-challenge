class VideosController < ApplicationController
  def index
    @data = ZypeApi::Services::Videos.page(page_number)
  end

  def show
    @video = ZypeApi::Services::Videos.get(params[:id])
    @customer_entitled = @video.free_to_play?
    render and return if @customer_entitled

    if current_user
      @customer_entitled = ZypeApi::Services::Videos.customer_entitled_for?(params[:id], current_user.access_token)
    else
      # User must authenticate first
      session[:previous_route] = request.env['PATH_INFO']
      redirect_to new_login_path
    end
  end

  private

  def page_number
    params[:page] || 1
  end
end

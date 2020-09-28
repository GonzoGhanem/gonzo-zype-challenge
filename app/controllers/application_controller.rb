class ApplicationController < ActionController::Base
  rescue_from ZypeApi::Services::Error, with: -> { redirect_to videos_path }

  def current_user
    return @current_user if @current_user

    return nil unless session[:oauth_json]
    
    @current_user = ZypeApi::Models::Oauth.new(session[:oauth_json])
  end
end

class ApplicationController < ActionController::Base
  rescue_from ZypeApi::Services::Errors::BasicError, with: -> { redirect_to videos_path }
  rescue_from ZypeApi::Services::Errors::Unauthorized, with: -> { redirect_to new_login_path }

  def current_user
    return @current_user if @current_user

    return nil unless session[:oauth_json]
    
    current_oauth = ZypeApi::Models::Oauth.new(session[:oauth_json])
    raise ZypeApi::Services::Errors::Unauthorized.new() if current_oauth.expired?

    refreshed_oauth = ZypeApi::Services::Oauth.refresh(current_oauth.refresh_token)
    session[:oauth_json] = refreshed_oauth.as_json

    @current_user = refreshed_oauth
  end
end

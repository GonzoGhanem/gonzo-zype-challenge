module ApplicationHelper
  def current_user
    return @current_user if @current_user

    return nil unless session[:oauth_json]
    
    current_oauth = ZypeApi::Models::Oauth.new(session[:oauth_json])
    raise ZypeApi::Services::Errors::Unauthorized.new() if current_oauth.expired?

    refreshed_oauth = ZypeApi::Services::Oauth.refresh(current_oauth.refresh_token)
    session[:oauth_json] = refreshed_oauth.as_json

    @current_user = refreshed_oauth
  end

  def debug_current_user_access_token
    current_user.present? ? "access_token: #{current_user.access_token}" : 'guest'
  rescue ZypeApi::Services::Errors::Unauthorized
    'guest'
  end
end

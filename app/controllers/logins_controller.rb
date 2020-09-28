class LoginsController < ApplicationController
  def new; end

  def create
    oauth = ZypeApi::Services::Oauth.authenticate(params.permit(:email)[:email], params.permit(:password)[:password])

    session[:oauth_json] = oauth.as_json
    redirect_to session[:previous_route] || videos_path
  end
end

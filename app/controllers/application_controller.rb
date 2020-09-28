class ApplicationController < ActionController::Base
  rescue_from ZypeApi::Services::Errors::BasicError, with: -> { redirect_to videos_path }
  rescue_from ZypeApi::Services::Errors::Unauthorized, with: -> { redirect_to new_login_path }

  include ApplicationHelper
end

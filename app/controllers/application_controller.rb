class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    if User.count == 0
      session[:user_id] = nil
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end

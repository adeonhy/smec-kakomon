class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  protect_from_forgery
  helper_method :current_user, :user_agent, :android?

  private
  def current_user
    if User.count == 0
      session[:user_id] = nil
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def user_agent
    request.headers['HTTP_USER_AGENT']
  end

  def android?
    user_agent =~ /Android/
  end
end

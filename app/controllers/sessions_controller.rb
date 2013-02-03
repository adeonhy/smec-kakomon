# coding: utf-8
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "ログインしました。"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "ログアウトしました。"
  end

  def mypage
    if uid = session[:user_id]
      @user = User.find(uid)
      @logs = @user.answer_logs.limit(100)
    else
      @user = nil
    end
  end
end

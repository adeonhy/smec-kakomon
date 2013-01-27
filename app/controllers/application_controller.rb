# coding: utf-8

class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  protect_from_forgery
  helper_method :current_user, :user_agent, :android?
  helper_method :abb, :abbifsmapho
  helper_method :login_path_by_google

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

  def abb(str) #スマホ用短縮表記
    ret = str
    table = [
      ['経済学・経済政策', '経済'],
      ['財務・会計', '財務'],
      ['企業経営理論', '経営'],
      ['運営管理', '運営'],
      ['経営法務', '法務'],
      ['経営情報システム', '情報'],
      ['中小企業経営・政策', '中小'],
    ]
    
    table.each do |k|
      ret = (ret == k[0] ? k[1] : ret)
    end

    # 括弧以降を削除
    matchindex = (ret =~ /[\(（]/ )
    if matchindex
      ret = ret[0...matchindex]
    end
    ret
  end

  def abbifsmapho(str)
    request.smart_phone? ? abb(str) : str
  end

  def login_path_by_google
    "/auth/open_id?openid_url=https://www.google.com/accounts/o8/id"
  end
end

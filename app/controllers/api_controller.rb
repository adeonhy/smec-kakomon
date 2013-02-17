class ApiController < ApplicationController

  def set_memo
    user_id = params[:user_id]
    question = params[:question]
    body = params[:body]

    info = UserInfo.find_or_create_by(user_id: user_id)
    info.memos[question] = body
    result = info.save

    render json: {success: result }
  end

  def get_memo
    user_id = params[:user_id]
    question = params[:question]

    info = UserInfo.where(user_id: user_id)
    memo = if info.exists?
             info.first.memos[question] || ""
           else 
             ""
           end
    
    render json: {memo:memo }
  end
end

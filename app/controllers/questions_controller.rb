# coding: utf-8
class QuestionsController < ApplicationController
  def index
    kamoku = { 
      'a'=> "経済学・経済政策",
      'b'=> "財務・会計",
      'c'=> "企業経営理論", 
      'd'=> "運営管理",
      'e'=> "経営法務", 
      'f'=> "経営情報システム", 
      'g'=> "中小企業経営・政策"
    }
    @questions = Question.all
    @themes = Theme.all
    @subject = kamoku[params[:subject]]
    @year = params[:year]
    @qnum = params[:number]
  end
end

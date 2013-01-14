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
    @subject = kamoku[params[:subject]]
    @year = params[:year]
    @qnum = params[:number]
    if @qnum # 問題番号単位での表示
      @questions = Question.where(subject: @subject, year: @year, number: @qnum).all
    else
      @questions = Question.where(subject: @subject, year: @year).all
    end
    @themes = Theme.all
  end
end

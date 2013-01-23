# coding: utf-8
class QuestionsController < ApplicationController

  Kamoku = { 
    'a'=> "経済学・経済政策",
    'b'=> "財務・会計",
    'c'=> "企業経営理論", 
    'd'=> "運営管理",
    'e'=> "経営法務", 
    'f'=> "経営情報システム", 
    'g'=> "中小企業経営・政策"
  }

  def index #/q/:subject/:year
    @subject = params[:subject]
    @kamoku = Kamoku[@subject]
    @year = params[:year]
    @qnum = params[:number]
    @questions = Question.where(subject: @subject, year: @year).all
    @themes = []
    @questions.each do |q|
      @themes[q.number] = Theme.where(themecode: q.themecode).first
    end
  end

  def show #/q/:subject/:year/:number
    @subject = params[:subject]
    @kamoku = Kamoku[@subject]
    @year = params[:year]
    @qnum = params[:number]
    @question = Question.where(subject: @subject, year: @year, number: @qnum).first
    @theme = Theme.where(themecode: @question.themecode).first
    @themequestions = Question.where(themecode: @question.themecode).all
    
    @comment = @question.comments.build
  end

  def answer
    @subject = params[:subject]
    @kamoku = Kamoku[@subject]
    @year = params[:year]
    @qnum = params[:number]
    @answer = params[:answer]
    @section_num = @answer.count(',') # 複数設問対応
    @right = Question.where(subject: @subject, year: @year, number: @qnum).first.answer.split(',')[@section_num]
    @answer.delete!(',')
    @correct = (@answer == @right)
    render json: { answer: @answer, correct: @correct, right: @right, section: @section_num }
  end
end

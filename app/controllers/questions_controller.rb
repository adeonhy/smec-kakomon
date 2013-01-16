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
    @kamokucode = params[:subject]
    @subject = Kamoku[@kamokucode]
    @year = params[:year]
    @qnum = params[:number]
    @questions = Question.where(subject: @subject, year: @year).all
    @themes = []
    @questions.each do |q|
      @themes[q.number] = Theme.where(themecode: q.themecode).first
    end
  end

  def show #/q/:subject/:year/:number
    @kamokucode = params[:subject]
    @subject = Kamoku[@kamokucode]
    @year = params[:year]
    @qnum = params[:number]
    @questions = Question.where(subject: @subject, year: @year, number: @qnum).all
    @theme = Theme.where(themecode: @questions.first.themecode).first
    @themequestions = Question.where(themecode: @questions.first.themecode).all
  end

  def answer
    @kamokucode = params[:subject]
    @subject = Kamoku[@kamokucode]
    @year = params[:year]
    @qnum = params[:number]
    @answer = params[:answer]
    @right = Question.where(subject: @subject, year: @year, number: @qnum).first.answer.split(',').first
    @correct = (@answer == @right)
    render json: { answer: @answer, correct: @correct, right: @right }
  end
end

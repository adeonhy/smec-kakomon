class CommentsController < ApplicationController
  def create
    subject = params[:subject]
    year = params[:year]
    number = params[:number]
    @question = Question.where(subject: subject, year: year, number: number).first
    @comment = @question.comments.new(params[:comment])

    if @comment.save
      redirect_to "/q/#{subject}/#{year}/#{number}"
    else
      @questions = Question.where(subject: subject, year: year, number: number).all
      @theme = Theme.where(themecode: @questions.first.themecode).first
      @themequestions = Question.where(themecode: @theme.themecode).all
      render template: 'questions/show'
      # redirect_to "/q/#{subject}/#{year}/#{number}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { comment: @comment }
  end
end

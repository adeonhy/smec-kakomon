class ThemesController < ApplicationController

  def index
    @themes = Theme.all
    @questions = Question.all
    @themecode = params[:themecode]

    if @themecode
      t = Theme.where(themecode: @themecode).first
      @maintheme = t.maintheme
      @subtheme = t.subtheme
      @themequestions = Question.where(themecode: @themecode).all
    end
  end
end

class ThemesController < ApplicationController

  def index
    @themes = Theme.all
    @questions = Question.all
    @themecode = params[:themecode]

    if @themecode.length == 3 
      @mainthemecode = @themecode
      @themecode = @mainthemecode + "001"
      @subthemes = Theme.where('themecode like ?', "#{@mainthemecode}%").all
      @subthemescount = {}
      @subthemes.each do |t|
        @subthemescount[t.themecode] = Question.where(themecode: t.themecode).count
      end
    end

    if @themecode
      t = Theme.where(themecode: @themecode).first
      @maintheme = t.maintheme
      @subtheme = t.subtheme
      if @mainthemecode
        @themequestions = Question.where('themecode like ?', "#{@mainthemecode}%").all
      else 
        @themequestions = Question.where(themecode: @themecode).all
      end
    end
  end
end

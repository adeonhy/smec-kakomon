class SetofsubyearsController < ApplicationController
  def index
    @setofsubyears= Setofsubyear.all
    @themes = Theme.all
    
    @themescount = {}
    @themes.each do |t|
      @themescount[t.themecode] = Question.where(themecode: t.themecode).count
    end

  end

  def create

  end

  def new

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end
end

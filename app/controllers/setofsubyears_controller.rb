# coding: utf-8
class SetofsubyearsController < ApplicationController
  def index
    @setofsubyears= Setofsubyear.all
    @themes = Theme.all
    
    @subthemescount = {}
    @mainthemescount = {}
    @themes.each do |t|
      @mainthemecode = t.themecode[0..2]
      @mainthemescount[@mainthemecode] ||= 0
      @subthemescount[t.themecode] = Question.where(themecode: t.themecode).count
      @mainthemescount[@mainthemecode] += @subthemescount[t.themecode]
    end

    @mainthemes = Theme.where("themecode like ?", "%001").all
    
    @theme_by_subject = [
      {code: 'a', subject: 'keizai',kamoku: "経済学・経済政策", themes: Theme.where('themecode like ?', '1__001').all},
      {code: 'b', subject: 'zaimu', kamoku: "財務・会計", themes: Theme.where('themecode like ?', '2__001').all},
      {code: 'c', subject: 'keiei', kamoku: "企業経営理論",themes: Theme.where('themecode like ?', '3__001').all},
      {code: 'd', subject: 'unei',  kamoku: "運営管理",themes: Theme.where('themecode like ?', '4__001').all},
      {code: 'e', subject: 'houmu', kamoku: "経営法務",themes: Theme.where('themecode like ?', '5__001').all},
      {code: 'f', subject: 'joho',  kamoku: "経営情報システム",themes: Theme.where('themecode like ?', '6__001').all},
      {code: 'g', subject: 'chusho',kamoku: "中小企業経営・政策",themes: Theme.where('themecode like ?', '7__001').all},
    ]

  end
end

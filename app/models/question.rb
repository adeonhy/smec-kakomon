# coding: utf-8
class Question < ActiveRecord::Base
  attr_accessible :answer, :number, :pdf, :png, :selectioncount, :subquestion, :svg, :themecode, :subject, :year
  has_many :comments
  has_many :answer_logs

  def self.to_kamoku(subject_code)
    { 
      'a' => '経済学・経済政策',
      'b' => '財務・会計',
      'c' => '企業経営理論',
      'd' => '運営管理',
      'e' => '経営法務',
      'f' => '経営情報システム',
      'g' => '中小企業経営・政策',
    }[subject_code]
  end

  def self.to_subject_code_by_themecode(themecode)
    [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g'][themecode[0].to_i]
  end

  def subject_code
    Question.to_subject_code_by_themecode(self.themecode)
  end

  def kamoku
    Question.to_kamoku(self.subject_code)
  end

  def maintheme
    Theme.where(themecode: self.themecode).first.maintheme
  end

  def subtheme
    Theme.where(themecode: self.themecode).first.subtheme
  end

  def next
    Question.where(subject: self.subject, year: self.year, number: (self.number)+1).first
  end
  
  def prev
    Question.where(subject: self.subject, year: self.year, number: (self.number)-1).first
  end

end

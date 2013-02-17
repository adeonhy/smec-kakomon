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

  def history(user)
    if user
      user.answer_logs.where(question_id: self.id).limit(3)
    else
      []
    end
  end

  def last3count(user)
    # hist =  user.answer_logs.where(question_id: self.id).limit(3).group(:correct).size
    # hist[true] ||= 0
    # hist[false] ||= 0
    # hist
     history(user).map{|h|h.correct}.inject(Hash.new(0)){|acc,item|acc[item]+=1;acc}
  end

  def last3status(user) #info(lightblue), success(green), error(red)
    t = last3count(user)[true]
    f = last3count(user)[false]
    
    if (t==0) && (f==0)
      ""
    elsif ((t==2) && (f==0)) || t==3 
      "info"
    elsif t > f
      "success"
    else
      "error"
    end 
  end

  def code
    "#{self.subject}/#{self.year}/#{"%02d" % self.number}"
  end

  def self.find_by_code(code)
    subject, year, number = code.split('/')
    Question.where(subject: subject, year: year.to_i, number: number.to_i).first
  end

end

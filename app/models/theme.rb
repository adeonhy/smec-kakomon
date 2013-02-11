class Theme < ActiveRecord::Base
  attr_accessible :maintheme, :subtheme, :themecode

  def mainthemecode
    self.themecode[0..2]
  end

  def subject
    Question.to_subject_code_by_themecode(self.themecode)
  end

  def kamoku
    Question.to_kamoku(self.subject)
  end

  def questions
    Question.where(themecode: self.themecode)
  end
end

class Question < ActiveRecord::Base
  attr_accessible :answer, :number, :pdf, :png, :selectioncount, :subquestion, :svg, :themecode, :subject, :year
  has_many :comments
end

class AnswerLog < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :choose, :correct, :section_num, :question_id, :user_id
end

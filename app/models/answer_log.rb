class AnswerLog < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :choose, :correct, :section_num, :question_id, :user_id

  def times
    # この問題を解くのは何回目か
    AnswerLog.group(:question_id, :user_id).size[[self.question_id, self.user_id]]
  end

end

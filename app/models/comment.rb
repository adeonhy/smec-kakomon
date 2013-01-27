class Comment < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :body, :commenter, :question_id, :user_id

  validates :body, presence: true, 
            length: { minimum: 5, maximum: 140}

end

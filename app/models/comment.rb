class Comment < ActiveRecord::Base
  belongs_to :question
  attr_accessible :body, :commenter

  validates :commenter, presence: true
  validates :body, presence: true, 
            length: { minimum: 5, maximum: 140}

end

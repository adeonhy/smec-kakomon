class User < ActiveRecord::Base
  attr_accessible :config, :name, :provider, :set, :uid
  has_many :answer_logs
  has_many :comments

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = (auth['user_info']||auth['info'])['name']
      user.config = {mail: (auth['user_info']||auth['info'])['email'] }.to_json

    end
  end
end

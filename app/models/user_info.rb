class UserInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: Integer # user_id
  field :memos, type: Hash, default: {} # {"a201201" => "memo..." }
  field :stars, type: Array, default: [] # ["a201201", "b201001", ..,]
end

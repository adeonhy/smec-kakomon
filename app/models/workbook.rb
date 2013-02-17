class Workbook
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :questions, type: String

end

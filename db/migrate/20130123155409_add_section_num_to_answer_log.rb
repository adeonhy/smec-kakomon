class AddSectionNumToAnswerLog < ActiveRecord::Migration
  def change
    add_column :answer_logs, :section_num, :integer
  end
end

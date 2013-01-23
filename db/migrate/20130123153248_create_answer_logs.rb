class CreateAnswerLogs < ActiveRecord::Migration
  def change
    create_table :answer_logs do |t|
      t.references :question
      t.references :user
      t.boolean :correct
      t.string :choose

      t.timestamps
    end
    add_index :answer_logs, :question_id
    add_index :answer_logs, :user_id
  end
end

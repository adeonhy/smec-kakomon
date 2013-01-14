class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number
      t.integer :subquestion
      t.string :themecode
      t.string :selectioncount
      t.string :answer
      t.string :svg
      t.string :pdf
      t.string :png

      t.timestamps
    end
  end
end

class AddYearToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :year, :integer
  end
end

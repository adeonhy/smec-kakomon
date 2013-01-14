class CreateSetofsubyears < ActiveRecord::Migration
  def change
    create_table :setofsubyears do |t|
      t.string :subject
      t.string :year
      t.boolean :available

      t.timestamps
    end
  end
end

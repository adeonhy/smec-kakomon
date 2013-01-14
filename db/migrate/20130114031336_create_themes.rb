class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :themecode
      t.string :maintheme
      t.string :subtheme

      t.timestamps
    end
  end
end

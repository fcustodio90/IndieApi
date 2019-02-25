class CreateHighlights < ActiveRecord::Migration[5.2]
  def change
    create_table :highlights do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :genre
      t.integer :year_released
      t.string :classification
      t.string :description

      t.timestamps
    end
  end
end

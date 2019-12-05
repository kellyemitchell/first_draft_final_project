class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.date :date
      t.string :caption
      t.integer :venue_id
      t.string :photo_location

      t.timestamps
    end
  end
end

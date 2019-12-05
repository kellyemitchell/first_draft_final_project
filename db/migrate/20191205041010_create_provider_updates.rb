class CreateProviderUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :provider_updates do |t|
      t.string :breakfast
      t.string :lunch
      t.string :snacks
      t.string :activities
      t.integer :user_id
      t.date :date
      t.string :reminders
      t.integer :venue_id

      t.timestamps
    end
  end
end

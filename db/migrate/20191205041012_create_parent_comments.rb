class CreateParentComments < ActiveRecord::Migration[5.1]
  def change
    create_table :parent_comments do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end

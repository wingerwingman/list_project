class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :category_id 
      t.integer :user_id 
      t.string :description 
      t.integer :item_id

      t.timestamps
    end
  end
end

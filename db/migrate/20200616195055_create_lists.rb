class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :item_id 
      t.integer :catagory_id 
      t.integer :user_id 

      t.timestamps
    end
  end
end

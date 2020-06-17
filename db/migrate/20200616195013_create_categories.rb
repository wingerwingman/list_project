class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :list_id 
      t.integer :user_id 
      t.string :type 
      t.string :description 
      
      t.timestamps
    end
  end
end

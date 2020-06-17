class ListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.integer :list_id 
      t.integer :item_id

      t.timestamps
    end

  end
end

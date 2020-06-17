class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description 
      t.boolean :checked_off, default: false

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.column :is_active, :boolean, :null => false, :default => true
      t.timestamps
    end
  end
end

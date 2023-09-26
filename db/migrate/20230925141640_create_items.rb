class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :item_name
      t.integer :item_price
      t.references :restaurant_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end

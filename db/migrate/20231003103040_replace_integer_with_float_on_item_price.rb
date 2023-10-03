class ReplaceIntegerWithFloatOnItemPrice < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :item_price, :integer
    add_column :items, :item_price, :float
  end
end

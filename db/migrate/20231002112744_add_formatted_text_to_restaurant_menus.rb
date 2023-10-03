class AddFormattedTextToRestaurantMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_menus, :formatted_text, :text
  end
end

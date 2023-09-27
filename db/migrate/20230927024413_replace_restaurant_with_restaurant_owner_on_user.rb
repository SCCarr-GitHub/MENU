class ReplaceRestaurantWithRestaurantOwnerOnUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :restaurant, :boolean
    add_column :users, :restaurant_owner, :boolean
  end
end

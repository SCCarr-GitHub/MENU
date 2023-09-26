class AddRestaurantToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :restaurant, :boolean
  end
end

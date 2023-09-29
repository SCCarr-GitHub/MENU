class AddPhotoDescriptionToRestaurantMenu < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurant_menus, :photo_description, :text
  end
end

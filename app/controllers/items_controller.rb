class ItemsController < ApplicationController

  def create_items
    @restaurant_menu = RestaurantMenu.find(params[:restaurant_menu_id])
    @items = @restaurant_menu.formatted_text
    # key_replacements = {
    #   "Appetizers" => "starters",
    #   "Main Course" => "mains",
    #   "Dessert" => "desserts",
    #   "Drinks" => "drinks"
    # }
    # @items.each do |category|
    #   new_category = key_replacements[category] || category
    #   formatted_text[new_category] = formatted_text.delete(category)
    # end
  end

  private

  def items_params
    params.require(:items).permit(:category, :item_name, :item_price, :restaurant_menu_id, :photo)
  end
end

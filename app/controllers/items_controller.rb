class ItemsController < ApplicationController

  def create_items
    @restaurant_menu = RestaurantMenu.find(params[:restaurant_menu_id])
    key_replacements
    @items_string = @restaurant_menu.formatted_text
    @items = eval @items_string
    updated_items = {}

    @items.each do |key, value|
      updated_key = key_replacements[key] || key
      updated_items[updated_key] = value
    end
    @items = updated_items
    @items.each do |_category, items|
      items.each do |item|
        item["item_name"] = item.delete("name")
        item["item_price"] = item.delete("price")
      end
    end
    Item.import_items_from_hash(@items, @restaurant_menu)
  end

  private

  def items_params
    params.require(:items).permit(:category, :item_name, :item_price, :restaurant_menu_id, :photo)
  end

  def key_replacements
    {
      "Appetizer" => "starter",
      "Appertifs" => "starter",
      "Starters" => "starter",
      "Entrees" => "starter",
      "Mains" => "main",
      "Main Course" => "main",
      "Main Courses" => "main",
      "Lunch" => "main",
      "Dinner" => "main",
      "Breakfast" => "main",
      "Pizza" => "main",
      "Burgers" => "main",
      "Pasta" => "main",
      "Salads" => "main",
      "Sushi" => "main",
      "Steak" => "main",
      "Chicken" => "main",
      "Wraps" => "main",
      "Main Dishes" => "main",
      "Fish" => "main",
      "Light Meals" => "main",
      "Dessert" => "dessert",
      "Desserts" => "dessert",
      "Ice Cream" => "dessert",
      "Sweet" => "dessert",
      "Pie" => "dessert",
      "Drinks" => "drink",
      "Shakes" => "drink",
      "Soft Drinks" => "drink",
      "Beverages" => "drink",
      "Alcoholic Beverages" => "drink",
      "Coffee" => "drink",
      "Tea" => "drink",
      "Water" => "drink"
  }
  end
end

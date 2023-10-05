require 'net/http'
require 'json'
class RestaurantMenusController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :edit, :update, :index]

  def index
    @item = Item.new
    @restaurant_items = []
    @restaurant_menus = @restaurant.restaurant_menus
    @this_restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_menus.each do |restaurant_menu|
      restaurant_menu.items.each do |item|
        @restaurant_items << item
      end
    end
    @starters = @restaurant_items.select { |item| item.category == "starter" }
    @mains = @restaurant_items.select { |item| item.category == "main" }
    @desserts = @restaurant_items.select { |item| item.category == "dessert" }
    @drinks = @restaurant_items.select { |item| item.category == "drink" }
  end

  def new
    @restaurant_menu = RestaurantMenu.new
  end

  def create
    @restaurant_menu = RestaurantMenu.new(restaurant_menu_params)
    @restaurant_menu.restaurant = @restaurant

    if @restaurant_menu.save
      # extracted_text = @restaurant_menu.photo_description
      # formatted_text = format_menu_text(extracted_text)
      # # @restaurant_menu = format_menu_text(formatted_text)
      # # @restaurant_menu.formatted_text = test_hash
      # @restaurant_menu.formatted_text = final_structure(formatted_text)
      # @restaurant_menu.save
      # if @restaurant_menu.persisted?
      redirect_to controller: 'items', action: 'create_items', restaurant_menu_id: @restaurant_menu.id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @rating = Rating.new
    @restaurant_menu = RestaurantMenu.find(params[:id])
    @this_restaurant = @restaurant_menu.restaurant
    @menus = @this_restaurant.restaurant_menus
    @items = []
    @menus.each do |menu|
      menu.items.each do |item|
        @items << item
      end
    end
    @starters = @items.select { |item| item.category == "starter" }
    @mains = @items.select { |item| item.category == "main" }
    @desserts = @items.select { |item| item.category == "dessert" }
    @drinks = @items.select { |item| item.category == "drink" }
  end

  def edit
    @restaurant_menu = current_user.restaurant_menu
  end

  def update
    @restaurant_menu = current_user.restaurant_menu
    if @restaurant_menu.update(restaurant_menu_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def restaurant_menu_params
    params.require(:restaurant_menu).permit(:description, :restaurant_id, :photo_description, :formatted_text, photos: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # def format_menu_text(extracted_text)
  #   api_key = ENV["OPEN_API_KEY"]

  #   url = URI.parse('https://api.openai.com/v1/completions')
  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true

  #   request = Net::HTTP::Post.new(url.request_uri)
  #   request['Authorization'] = "Bearer #{api_key}"
  #   request['Content-Type'] = 'application/json'

  #   prompt = "Reformat the following restaurant menu:#{extracted_text}"
  #   prompt += "Organize the menu items into a Ruby hash with categories as keys and include the name of the item and associated price for that item."
  #   prompt += "Exclude sections that sort and calculate totals."
  #   prompt += "Clean up unnecessary empty spaces and any information that is not a menu item or price as well as remove any duplicated items"
  #   prompt += "Do not repeat yourself when providing a sample output of the program."

  #   payload = {
  #     prompt: prompt,
  #     max_tokens: 1000,
  #     temperature: 0.1,
  #     model: "text-davinci-003"
  #   }

  #   request.body = payload.to_json

  #   response = http.request(request)

  #   if response.code == '200'
  #     formatted_text = JSON.parse(response.body)['choices'][0]['text']

  #     puts "#{formatted_text}"

  #     return formatted_text
  #   else
  #     Rails.logger.error "ChatGPT API Request Error: #{response.code} - #{response.body}"
  #     return 'Failed to format text'
  #   end
  # end

  # def final_structure(formatted_text)
  #   api_key = ENV["OPEN_API_KEY"]

  #   url = URI.parse('https://api.openai.com/v1/completions')
  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true

  #   request = Net::HTTP::Post.new(url.request_uri)
  #   request['Authorization'] = "Bearer #{api_key}"
  #   request['Content-Type'] = 'application/json'

  #   prompt = "Note the following data:#{formatted_text}"
  #   prompt += "Organize the data so that it looks like the following:#{prompt_hash}"
  #   prompt += "Keep the item_name and item_price keys with the values being the name and price"

  #   payload = {
  #     prompt: prompt,
  #     max_tokens: 1000,
  #     temperature: 0.1,
  #     model: "text-davinci-003"
  #   }

  #   request.body = payload.to_json

  #   response = http.request(request)

  #   if response.code == '200'
  #     formatted_text = JSON.parse(response.body)['choices'][0]['text']

  #     puts "#{formatted_text}"
  #     return formatted_text
  #   else
  #     Rails.logger.error "ChatGPT API Request Error: #{response.code} - #{response.body}"
  #     return 'Failed to format text'
  #   end
  # end

  # def prompt_hash
  #   '@items = {
  #     "starter" => [
  #       {
  #         "item_name" => "Garlic Bread",
  #         "item_price" => 6.99
  #       }
  #     ],
  #     "main" => [
  #       {
  #         "item_name" => "Grilled Fingerlings",
  #         "item_price" => 6.99
  #       }
  #     ],
  #     "dessert" => [
  #       {
  #         "item_name" => "Banana Split",
  #         "item_price" => 6.99
  #       }
  #     ],
  #     "drink" => [
  #       {
  #         "item_name" => "Coffee",
  #         "item_price" => 6.99
  #       }
  #     ]
  #   }'
  # end

  # def test_hash
  #   @items = {
  #     "Appetizer" => [
  #       {
  #         "name" => "Garlic Bread",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Potato Wedges",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Meat Ball",
  #         "price" => 2.99
  #       },
  #       {
  #         "name" => "Onion Rings",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "French Fries",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Ratatouille",
  #         "price" => 2.99
  #       }
  #     ],
  #     "Main Course" => [
  #       {
  #         "name" => "Grilled Fingerlings",
  #         "price" => 5.99
  #       },
  #       {
  #         "name" => "Grilled potatoes with a Western flair served with sauce of choice.",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Asian Pear Salad",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Crisp pears and pecan and maple syrup with cheese frisée.",
  #         "price" => 5.99
  #       },
  #       {
  #         "name" => "Roasted Acorn Squash",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Spicy-sweet, soft wedges potatoes.",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Smothered Chicken",
  #         "price" => 6.99
  #       },
  #       {
  #         "name" => "Grilled chicken breast topped with mushrooms, onions, and cheese",
  #         "price" => 7.99
  #       }
  #     ],
  #     "Dessert" => [
  #       {
  #         "name" => "Banana Split",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Cheese Cake",
  #         "price" => 4.99
  #       },
  #       {
  #         "name" => "Chocolate Ice Cream",
  #         "price" => 3.99
  #       },
  #       {
  #         "name" => "Fruit Cake",
  #         "price" => 4.99
  #       }
  #     ],
  #     "Drinks" => [
  #       {
  #         "name" => "Coffee",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Ice/Hot Tea",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Thai Tea",
  #         "price" => 1.99
  #       },
  #       {
  #         "name" => "Soda",
  #         "price" => 1.99
  #       }
  #     ]
  #   }
  # end
end

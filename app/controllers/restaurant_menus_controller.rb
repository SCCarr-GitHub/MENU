class RestaurantMenusController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :edit, :update]

  def new
    @restaurant_menu = RestaurantMenu.new
  end

  def create
    @restaurant_menu = RestaurantMenu.new(restaurant_menu_params)
    @restaurant_menu.restaurant = @restaurant

    if @restaurant_menu.save
      Rails.logger.info("photo_description: #{@restaurant_menu.photo_description}")
      extracted_text = @restaurant_menu.photo_description
      formatted_text = format_menu_text(extracted_text)
      @restaurant_menu.formatted_text = formatted_text

      @restaurant_menu.save

      if @restaurant_menu.persisted?
        redirect_to tess_pages_path(@restaurant_menu)
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @this_restaurant = Restaurant.find(params[:id])
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

  def format_menu_text(extracted_text)
    require 'net/http'
    require 'json'

    api_key = ENV["OPEN_API_KEY"]

    url = URI.parse('https://api.openai.com/v1/engines/davinci/completions')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request['Authorization'] = "Bearer #{api_key}"
    request['Content-Type'] = 'application/json'

    prompt = "Reformat the restaurant menu, instructions to follow: #{extracted_text} "
    prompt += "Organize the menu items into a Ruby hash with categories as keys and include the name of the item and associated price."
    prompt += "Exclude sections that sort and calculate totals."
    prompt += "Clean up unnecessary empty spaces and any information that is not a menu item or price as well as remove any duplicated items"

    payload = {
      prompt: prompt,
      max_tokens: 1000,
      temperature: 0.2
    }

    request.body = payload.to_json

    response = http.request(request)

    if response.code == '200'
      formatted_text = JSON.parse(response.body)['choices'][0]['text']

      Rails.logger.debug "ChatGPT API Response: #{formatted_text}"
      return formatted_text
    else
      Rails.logger.error "ChatGPT API Request Error: #{response.code} - #{response.body}"
      return 'Failed to format text'
    end
  end
end

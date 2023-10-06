class ItemsController < ApplicationController

  def create_items
    @restaurant_menu = RestaurantMenu.find(params[:restaurant_menu_id])
    extracted_text = @restaurant_menu.photo_description
    formatted_text = format_menu_text(extracted_text)
    @restaurant_menu.formatted_text = final_structure(formatted_text)
    @items = eval final_structure(formatted_text)
    updated_items = {}
    @items.each do |key, value|
      updated_key = key_replacements[key] || key
      updated_items[updated_key] = value
    end
    @items = updated_items
    Item.import_items_from_hash(@items, @restaurant_menu)
    redirect_to restaurant_restaurant_menus_path(@restaurant_menu.restaurant)
  end

  def create
    @item = Item.new(item_params)
    @restaurant_menu = RestaurantMenu.find(params[:restaurant_menu_id])
    @item.restaurant_menu = @restaurant_menu
    respond_to do |format|
      if @item.save
        redirect_to restaurant_restaurant_menus_path(@restaurant_menu.restaurant)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @restaurant_menu = @item.restaurant_menu
    respond_to do |format|
      @item.update(item_params)
      if @item.update(item_params)
        redirect_to restaurant_restaurant_menus_path(@restaurant_menu.restaurant)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @restaurant_menu = @item.restaurant_menu
    @item.destroy
    redirect_to restaurant_restaurant_menus_path(@restaurant_menu.restaurant), status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:category, :item_name, :item_price, :photo)
  end

  def format_menu_text(extracted_text)
    api_key = ENV["OPEN_API_KEY"]

    url = URI.parse('https://api.openai.com/v1/completions')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request['Authorization'] = "Bearer #{api_key}"
    request['Content-Type'] = 'application/json'

    prompt = "Reformat the following restaurant menu:#{extracted_text}"
    prompt += "Organize the menu items into a Ruby hash with categories as keys and include the name and associated price for that item."
    prompt += "Exclude sections that sort and calculate totals."
    prompt += "Clean up unnecessary empty spaces and any information that is not a menu item or price as well as remove any duplicated items"
    prompt += "Do not repeat yourself when providing a sample output of the program."

    payload = {
      prompt: prompt,
      max_tokens: 1000,
      temperature: 0.1,
      model: "text-davinci-003"
    }

    request.body = payload.to_json

    response = http.request(request)

    if response.code == '200'
      formatted_text = JSON.parse(response.body)['choices'][0]['text']

      puts "#{formatted_text}"

      return formatted_text
    else
      Rails.logger.error "ChatGPT API Request Error: #{response.code} - #{response.body}"
      return 'Failed to format text'
    end
  end

  def final_structure(formatted_text)
    api_key = ENV["OPEN_API_KEY"]

    url = URI.parse('https://api.openai.com/v1/completions')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request['Authorization'] = "Bearer #{api_key}"
    request['Content-Type'] = 'application/json'

    prompt = "Note the following data:#{formatted_text}"
    prompt += "Organize the data so that it looks like the following:#{prompt_hash}"
    prompt += "Keep the item_name and item_price keys with the values being the name and price"
    prompt += "Return as Ruby hash"

    payload = {
      prompt: prompt,
      max_tokens: 1000,
      temperature: 0.1,
      model: "text-davinci-003"
    }

    request.body = payload.to_json

    response = http.request(request)

    if response.code == '200'
      formatted_text = JSON.parse(response.body)['choices'][0]['text']

      puts "#{formatted_text}"
      return formatted_text
    else
      Rails.logger.error "ChatGPT API Request Error: #{response.code} - #{response.body}"
      return 'Failed to format text'
    end
  end

  def prompt_hash
    @items = {
      "starter" => [
        {
          "item_name" => "Garlic Bread",
          "item_price" => 6.99
        }
      ],
      "main" => [
        {
          "item_name" => "Grilled Fingerlings",
          "item_price" => 6.99
        }
      ],
      "dessert" => [
        {
          "item_name" => "Banana Split",
          "item_price" => 6.99
        }
      ],
      "drink" => [
        {
          "item_name" => "Coffee",
          "item_price" => 6.99
        }
      ]
    }
  end

  def key_replacements
    {
      "Appetizer" => "starter",
      "Appertifs" => "starter",
      "Starters" => "starter",
      "Entrees" => "starter",
      "Sides" => "starter",
      "Side" => "starter",
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
      "Combo" => "main",
      "Combos" => "main",
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

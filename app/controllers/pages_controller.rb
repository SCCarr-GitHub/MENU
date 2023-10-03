class PagesController < ApplicationController
  def home
    
    @restaurants = Restaurant.all
    if user_signed_in?
      @customer = current_user.customer
    end
  end

  # def menu
  #   @this_restaurant = Restaurant.find(params[:restaurant_id])
  #   @items = Item.all
  # end
  def tesseract
    @restaurant_menu = RestaurantMenu.find(params[:id])
  end

  def search
    @top_rated = Item.joins(:ratings)
    .group('items.id')
    .order('COUNT(ratings.id) DESC')
    .limit(10)
    @sample_top_rated = @top_rated.sample(4)
    if params[:query].present?
      @query = params[:query]
      @search_results = PgSearch.multisearch(@query).includes(:searchable)
    else
      @search_results = []
    end
  end
end

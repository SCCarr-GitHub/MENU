class RatingsController < ApplicationController
  before_action :set_item, only: :upvote
  before_action :set_customer, only: :upvote

  def upvote
    @restaurant_menu = @item.restaurant_menu
    @rating = Rating.new
    @rating.item = @item
    @rating.customer = @customer
    if @rating.save
      redirect_to restaurant_restaurant_menus_path(@restaurant_menu)
    else
      redirect_to restaurant_restaurant_menus_path(@restaurant_menu), status: :unprocessable_entity
    end
  end

  def leaderboard
    @top_rated = Item.joins(:ratings)
                     .group('items.id')
                     .order('COUNT(ratings.id) DESC')
                     .limit(10)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_customer
    @customer = current_user.customer
  end
end

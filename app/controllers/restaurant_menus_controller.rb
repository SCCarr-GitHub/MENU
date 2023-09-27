class RestaurantMenusController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :edit, :update]

  def new
    @restaurant_menu = RestaurantMenu.new
  end

  def create
    @restaurant_menu = RestaurantMenu.new(restaurant_menu_params)
    @restaurant_menu.restaurant = @restaurant
    if @restaurant_menu.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant_menu = @restaurant.restaurant_menus.find(params[:menu_id])
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
    params.require(:restaurant_menu).permit(:description, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

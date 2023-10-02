class RestaurantsController < ApplicationController
  before_action :set_user, only:[:new, :create]

  def index
    @restaurants = Restaurant.all
    # @markers = @restaurants.geocoded.map do |restaurant|
    #   {
    #     lat: restaurant.latitude,
    #     lng: restaurant.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { restaurant: restaurant }),
    #     marker_html: render_to_string(partial: "marker")
    #   }
    # end
  end

  def show
    @this_restaurant = Restaurant.find(params[:id])
    @restaurant_menu = @this_restaurant.restaurant_menus
    @review = Review.new
    if user_signed_in?
      @restaurant = current_user.restaurant
      @customer = current_user.customer
    end
    @users = User.all
    @reviews = @this_restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = current_user.restaurant
  end

  def update
    @restaurant = current_user.restaurant
    if @restaurant.update(restaurant_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path(@restaurant.list), status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:address, :phone_number, :name, :category, :opening_time, :closing_time)
  end

  def set_user
    @user = current_user
  end
end

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
    @restaurant = Restaurant.find(params[:id])
    # @users = User.all
    # @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = @user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to user_restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path(@restaurant.list), status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:address, :phone_number, :name, :category, :opening_time, :closing_time, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_customer, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.customer = @customer
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_path(@restaurant), status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

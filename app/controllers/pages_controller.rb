class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
    if user_signed_in?
      @customer = current_user.customer
    end
  end
end

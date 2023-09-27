class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
    @customer = current_user.customer
  end
end

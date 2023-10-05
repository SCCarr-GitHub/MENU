class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
    if user_signed_in?
      @customer = current_user.customer
    end
    @users = User.all
    @markers = @restaurants.geocoded.map do |result|
      {
        lat: result.latitude,
        lng: result.longitude,
        info_window_html: render_to_string(partial: "restaurants/info_window", locals: { result: }),
        marker_html: render_to_string(partial: "restaurants/marker", locals: { result: })
      }
    end
  end

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
      @restaurants_array = @search_results.map { |search_result| search_result.searchable}
      @markers = []

      @restaurants_array.each do |result|
        unless result.instance_of? Item
          if result.geocoded?
            marker_hash = {
              lat: result.latitude,
              lng: result.longitude,
              info_window_html: render_to_string(partial: "restaurants/info_window", locals: { result: }),
              marker_html: render_to_string(partial: "restaurants/marker", locals: { result: })
            }
            @markers << marker_hash
          end
        else
          result = result.restaurant_menu.restaurant
          if result.geocoded?
            marker_hash = {
              lat: result.latitude,
              lng: result.longitude,
              info_window_html: render_to_string(partial: "restaurants/info_window", locals: { result: }),
              marker_html: render_to_string(partial: "restaurants/marker", locals: { result: })
            }
            @markers << marker_hash
          end
        end
      end
    else
      @search_results = []

      @restaurants = Restaurant.all

      @markers = @restaurants.geocoded.map do |result|
        {
          lat: result.latitude,
          lng: result.longitude,
          info_window_html: render_to_string(partial: "restaurants/info_window", locals: { result: }),
          marker_html: render_to_string(partial: "restaurants/marker", locals: { result: })
        }
      end
    end
  end
end

class RestaurantMenu < ApplicationRecord
  belongs_to :restaurant

  has_many :items
  has_many_attached :photos
end

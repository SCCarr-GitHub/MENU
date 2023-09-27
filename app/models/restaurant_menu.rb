class RestaurantMenu < ApplicationRecord
  belongs_to :restaurant

  has_many :items, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end

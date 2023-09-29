class RestaurantMenu < ApplicationRecord
  belongs_to :restaurant
  # validates :text, presence: true
  has_many :items, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end

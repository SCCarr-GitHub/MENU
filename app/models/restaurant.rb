class Restaurant < ApplicationRecord
  belongs_to :user

  has_many :reviews
  has_one :restaurant_menu
  has_many :items, through: :restaurant_menu
end

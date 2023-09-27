class Restaurant < ApplicationRecord
  belongs_to :user
  
  has_many :reviews, dependent: :destroy
  has_one :restaurant_menu, dependent: :destroy
  has_many :items, through: :restaurant_menu
end

class Restaurant < ApplicationRecord
  belongs_to :user
  
  has_many :reviews, dependent: :destroy
  has_many :restaurant_menus, dependent: :destroy
  has_many :items, through: :restaurant_menus
end

class Item < ApplicationRecord
  belongs_to :restaurantMenu

  has_many :ratings
end

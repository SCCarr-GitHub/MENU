class Item < ApplicationRecord
  belongs_to :restaurantMenus

  has_many :ratings
end

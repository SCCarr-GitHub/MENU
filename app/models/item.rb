class Item < ApplicationRecord
  include PgSearch::Model
  belongs_to :restaurantMenu
  has_many :ratings, dependent: :destroy

  multisearchable against:
      [ :item_name, :category ]
end

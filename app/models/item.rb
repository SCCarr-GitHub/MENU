class Item < ApplicationRecord
  include PgSearch::Model
  belongs_to :restaurant_menu
  has_many :ratings, dependent: :destroy

  multisearchable against:
      [ :item_name, :category ]
end

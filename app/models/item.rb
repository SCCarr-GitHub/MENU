class Item < ApplicationRecord
  include PgSearch::Model
  belongs_to :restaurant_menu
  has_many :ratings, dependent: :destroy
  has_one_attached :photo

  multisearchable against:
      [ :item_name, :category ]
end

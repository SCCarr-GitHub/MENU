class Restaurant < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :restaurant_menus, dependent: :destroy
  has_many :items, through: :restaurant_menus
  has_many_attached :photos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [ :name, :category ]
end

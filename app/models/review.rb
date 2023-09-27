class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  validates :content, presence: true
end

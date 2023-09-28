class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  validates :comment, presence: true
end

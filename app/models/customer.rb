class Customer < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ratings
end

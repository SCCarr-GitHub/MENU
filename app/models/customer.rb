class Customer < ApplicationRecord
  belongs_to :users

  has_many :reviews
  has_many :ratings
end

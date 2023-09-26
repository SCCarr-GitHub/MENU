class Rating < ApplicationRecord
  belongs_to :customers
  belongs_to :items

  has_many :items
end

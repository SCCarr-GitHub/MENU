class Review < ApplicationRecord
  belongs_to :restaurants
  belongs_to :customers
end

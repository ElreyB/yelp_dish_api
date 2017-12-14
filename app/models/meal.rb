class Meal < ApplicationRecord
  has_many :reviews
  validates :dish, :drink, :rating, :presence => true
end

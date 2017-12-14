class Meal < ApplicationRecord
  has_many :reviews
  validates :dish, :drink, :rating, :presence => true
  scope :search_by_dish, -> (dish){ where('dish = ?', dish)}
  scope :search_by_rating, -> (rating){where('rating = ?', rating)}
  scope :search_by_drink, -> (drink){where('drink = ?', drink)}
end

class Review < ApplicationRecord
  belongs_to :meal

  validates :content, :author, :presence => true
  scope :reviews, -> (meal_id){ where "meal_id = ?", meal_id }
  scope :by_author, -> (author){ where "author = ?", author}

end

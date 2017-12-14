class Review < ApplicationRecord
  belongs_to :meal

  validates :content, :author, :presence => true
end

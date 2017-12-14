class AddMealIdColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :meal_id, :integer
  end
end

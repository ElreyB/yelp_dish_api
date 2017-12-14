class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :dish
      t.string :drink
      t.integer :rating
    end
  end
end

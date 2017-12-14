class Seed
  def self.begin
    seed = Seed.new
    seed.generate_content
  end

  def generate_content
    Meal.destroy_all
    Review.destroy_all

    20.times do |i|
      meal = Meal.create!(
        dish: Faker::Food.dish,
        drink: Faker::Beer.style,
        rating: Faker::Number.between(1, 10)
      )

      5.times do |s|
        review = meal.reviews.create!(
          author: Faker::Name.name,
          content: Faker::Lorem.sentence(3),
        )
        puts "Review #{s}: Author is #{review.author}, content is #{review.content}.."
      end

      puts "Meal #{i}: City is #{meal.dish} and drink is #{meal.drink} and rating is #{meal.rating}."
    end
  end
end

Seed.begin

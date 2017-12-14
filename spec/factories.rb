FactoryBot.define do
  factory :meal do
    dish Faker::Food.dish
    drink Faker::Beer.style
    rating Faker::Number.between(1, 10)
  end
  factory :review do
    author Faker::Name.name
    content Faker::Lorem.sentence(3)
    meal
  end
end

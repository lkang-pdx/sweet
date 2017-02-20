FactoryGirl.define do
  factory :pin do
    description { Faker::Food.ingredient }
    board
    user
  end
end

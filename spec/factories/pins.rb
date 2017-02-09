FactoryGirl.define do
  factory :pin do
    description { Faker::Food.ingredient }
    user
  end
end

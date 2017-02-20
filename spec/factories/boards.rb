FactoryGirl.define do
  factory :board do
    name { Faker::Food.ingredient }
    user
  end
end

FactoryBot.define do
  factory :address do
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    zip { Faker::Number.number(5) }
  end
end

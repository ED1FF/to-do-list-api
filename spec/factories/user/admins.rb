FactoryBot.define do
  factory :admin, class: User::Admin do
    email { Faker::Internet.email }
    password '123321123321'
    password_confirmation '123321123321'
  end
end

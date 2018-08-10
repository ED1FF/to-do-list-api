FactoryBot.define do
  factory :member, class: User::Member do
    email { Faker::Internet.email }
    password '123321123321'
    password_confirmation '123321123321'
  end  
end

FactoryBot.define do
  factory :user do
    email Faker::Internet.email
    password '123321123321'
    password_confirmation '123321123321'
    factory :user_with_tasks do
      transient do
        tasks_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:task, evaluator.tasks_count)
        user.tasks << create_list(:task, evaluator.tasks_count)
      end
    end
  end
end

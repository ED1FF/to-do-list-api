FactoryBot.define do
  factory :comment do
    text "MyString"
    commentable_type "MyString"
    commentable_id 1
  end
end

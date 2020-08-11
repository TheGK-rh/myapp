FactoryBot.define do
  factory :task do
    title { "TEST Task" }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 1 }
    user_id { 1 }
    term { "2020-12-12" }
    association :category
    association :user
  end
end

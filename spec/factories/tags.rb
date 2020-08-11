FactoryBot.define do
  factory :tag do
    name { "TEST" }
    created_at { Time.now }
    updated_at { Time.now }
    user_id { 1 }
    association :user
  end
end

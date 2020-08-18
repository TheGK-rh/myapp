FactoryBot.define do
  factory :description do
    description { "TEST Description" }
    created_at { Time.now }
    updated_at { Time.now }
    user_id { 1 }
    task_id { 1 }
    association :user
    association :task
  end
end

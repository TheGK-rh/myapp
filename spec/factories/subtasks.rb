FactoryBot.define do
  factory :subtask do
    name { "TEST Subtask" }
    created_at { Time.now }
    updated_at { Time.now }
    user_id { 1 }
    task_id { 1 }
    association :user
    association :task
  end
end

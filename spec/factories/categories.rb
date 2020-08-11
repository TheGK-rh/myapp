FactoryBot.define do
  factory :category do
    name { "ToDoList" }
    created_at { Time.now }
    updated_at { Time.now }
  end
end

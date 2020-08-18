FactoryBot.define do

  factory :user do
    name { "Testuser" }
    email { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :other_user do
    name { "Otheruser" }
    email { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

end

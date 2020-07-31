FactoryBot.define do
  factory :user do
    name { "Testuser" }
    email { "testuser@sample.jp" }
    password { "password" }
    password_confirmation { "password" }
  end
end

FactoryBot.define do
  factory :attachment do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec_test.jpeg')) }
    created_at { Time.now }
    updated_at { Time.now }
    user_id { 1 }
    task_id { 1 }
    association :user
    association :task
  end
end

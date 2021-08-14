FactoryBot.define do
  factory :article do
    title { "test_title" }
    content { "test_content" }
    association :user
  end

end

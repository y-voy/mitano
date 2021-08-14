FactoryBot.define do
  factory :comment do
    content { "test_content" }
    association :article
    association :user, factory: :comment_user
  end
end

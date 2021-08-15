FactoryBot.define do

  factory :article do
    title { "test_title" }
    content { "test_content" }
    association :user
  end

  factory :article_foo_test do
    title { "foo" }
    content { "baa" }
    association :user, factory: :user_foo
  end

end

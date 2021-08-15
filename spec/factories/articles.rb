FactoryBot.define do

  factory :article do
    title { "test_title" }
    content { "test_content" }
    association :user
    after(:build) do |article|
      tag = create(:tag)
      article.taggings << build(:tagging, article: article, tag: tag)
    end
  end

  factory :article_foo, class: Article do
    title { "foo" }
    content { "baa" }
    association :user, factory: :user_foo
    after(:build) do |article|
      tag = create(:tag_foo)
      article.taggings << build(:tagging, article: article, tag: tag)
    end
  end

end

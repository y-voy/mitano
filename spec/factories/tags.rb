FactoryBot.define do

  factory :tag do
    name { "tag" }
  end

  factory :tag_a, class: Tag do
    name { "tag_a" }
  end

  factory :tag_b, class: Tag do
    name { "tag_b" }
  end

  factory :tag_foo, class: Tag do
    name { "foo" }
  end

end

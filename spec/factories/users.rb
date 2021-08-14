FactoryBot.define do
  factory :user do
    name { "tester" }
    email { "tester@dic.com" }
    password { "password" }
    admin { false }
  end
  factory :comment_user, class: User do
    name { "commenter" }
    email { "commenter@dic.com" }
    password { "password" }
    admin { false }
  end
end

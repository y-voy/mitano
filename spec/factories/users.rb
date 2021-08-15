FactoryBot.define do

  factory :user do
    name { "tester" }
    email { "tester@dic.com" }
    password { "password" }
    admin { false }
  end
  factory :admin, class: User do
    name { "admin" }
    email { "admin@dic.com" }
    password { "password" }
    admin { true }
  end
  factory :comment_user, class: User do
    name { "commenter" }
    email { "commenter@dic.com" }
    password { "password" }
    admin { false }
  end
  factory :user_foo, class: User do
    name { "foo" }
    email { "foo@dic.com" }
    password { "password" }
    admin { false }
  end

end

20.times do |i|
  User.create!(name: "User#{i}",
               email: "user#{i}@seed.com",
               password: "password",
               admin: false
               )
end

1.times do |n|
  User.create!(name: "admin",
               email: "admin@seed.com",
               password: "password",
               admin: true
               )
end

User.all.ids.each do |id|
  Article.create!(title: "title#{id}",
               content: "content_#{id}",
               user_id: id
               )
end

Tag.create!(
  [
    {
      name: "経営"
    },
    {
      name: "マーケティング"
    },
    {
      name: "会計"
    },
    {
      name: "オペレーション"
    },
    {
      name: "思考"
    },
  ]
)

10.times do
  Post.create!(title: Faker::Lorem.question, content: Faker::Lorem.paragraph, active: true)
end

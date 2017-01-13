20.times do
  user = User.create!( username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: Faker::Pokemon.name,
                       created_at: Time.now - rand(2000))
end

20.times do
  question = Question.create!(  title: Faker::Educator.course,
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: rand(1..20))
end

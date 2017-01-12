20.times do
  user = User.create!( username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password_hash: Faker::Pokemon.name,
                       created_at: Time.now - rand(2000))


end

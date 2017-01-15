User.all.delete_all
Question.all.delete_all
Comment.all.delete_all
Answer.all.delete_all
Vote.all.delete_all

20.times do
  user = User.new(  username: Faker::Internet.user_name,
                    email: Faker::Internet.email )
  user.password = Faker::Pokemon.name
  user.save!
end

# Useable login Info
helium_user = User.new( username: 'helium', email: 'helium@gmail.com')
helium_user.password = 'helium'
helium_user.save!


10.times do
  question = Question.new(  title: Faker::Educator.course,
                            body: Faker::Hipster.paragraph(2, true, 4) )
  question.author = User.all.sample
  question.save!
end

25.times do
  answer = Answer.new(  body: Faker::Hipster.paragraph(2, true, 4) )
  answer.author = User.all.sample
  answer.question = Question.all.sample
  answer.save!
end

25.times do
  comment = Question.all.sample.comments.new(body: Faker::Hipster.paragraph(2, true, 4))
  comment.author = User.all.sample
  comment.save!
end

25.times do
  comment = Answer.all.sample.comments.new(body: Faker::Hipster.paragraph(2, true, 4))
  comment.author = User.all.sample
  comment.save!
end

10.times do
  Answer.all.each do |answer|
    answer.votes.create!(user_id: User.all.sample.id, value: [true, false].sample)
  end

  Question.all.each do |question|
    question.votes.create!(user_id: User.all.sample.id, value: [true, false].sample)
  end

  Comment.all.each do |comment|
    comment.votes.create!(user_id: User.all.sample.id, value: [true, false].sample)
  end
end


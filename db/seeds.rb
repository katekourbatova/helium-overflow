User.all.delete_all
Question.all.delete_all
Comment.all.delete_all
Answer.all.delete_all
Vote.all.delete_all

20.times do
  user = User.new( username: Faker::Internet.user_name,
                       email: Faker::Internet.email)
  user.password = Faker::Pokemon.name
  user.save!
end

# Useable login Info
helium_user = User.new( username: 'helium', email: 'helium@gmail.com')
helium_user.password = 'helium'
helium_user.save!


20.times do
  question = Question.create!(  title: Faker::Educator.course,
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: rand(1..20))
end

50.times do
  answer = Answer.create!(  body: Faker::Hipster.paragraph(2, true, 4),
                            question_id: rand(1..20),
                            author_id: rand(1..20) )
end

50.times do
  author = User.all.sample
  comment = Comment.create!(
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: author.id, commentable_id: rand(1..20), commentable_type: ["Question", "Answer"].sample
                                )
end

50.times do
  comment = Comment.create!(
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: User.last.id, commentable_id: rand(1..20), commentable_type: ["Question", "Answer"].sample
                                )
end

50.times do
  answer = Answer.create!(  body: Faker::Hipster.paragraph(2, true, 4),
                            question_id: rand(1..20),
                            author_id: rand(1..20) )
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

User.all.delete_all
Question.all.delete_all
Comment.all.delete_all
Answer.all.delete_all
Vote.all.delete_all

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


50.times do
  comment = Comment.create!(
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: rand(1..20), commentable_id: rand(1..20), commentable_type: ["Question", "Answer"].sample
                                )
end

50.times do
  comment = Comment.create!(
                                body: Faker::Hipster.paragraph(2, true, 4),
                                author_id: 61, commentable_id: rand(1..20), commentable_type: ["Question", "Answer"].sample
                                )
end

50.times do
  answer = Answer.create!(  body: Faker::Hipster.paragraph(2, true, 4),
                            question_id: rand(1..20),
                            author_id: rand(1..20) )
end

10.times do
  Answer.each.do |answer|
    answer.votes.create!(user_id: User.all.sample, value: [true, false].sample)
  end

  Question.each.do |question|
    question.votes.create!(user_id: User.all.sample, value: [true, false].sample)
  end

  Comment.each.do |comment|
    comment.votes.create!(user_id: User.all.sample, value: [true, false].sample)
  end
end

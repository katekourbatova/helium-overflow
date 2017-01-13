FactoryGirl.define do

  factory :answer do
    body Faker::Lorem.paragraph
    is_best false
    question_id 1
    author_id 1
  end

  factory :question do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    author_id 1
  end

  factory :user do
    username Faker::Lorem.word
    email Faker::Internet.email
    password Faker::Internet.password
  end

end

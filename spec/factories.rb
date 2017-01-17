FactoryGirl.define do

  factory :answer do
    sequence(:body) {|n| "Answer Body #{n}" }
    is_best false
    association :question, factory: :question
    association :author, factory: :user
  end

  factory :question do
    sequence(:title) {|n| "Question Title #{n}" }
    sequence(:body) {|n| "Question Body #{n}" }
    association :author, factory: :user
  end

  factory :user do
    sequence(:username) {|n| "user-#{n}" }
    sequence(:email) {|n| "user-#{n}@example.com" }
    password "password1"
  end

  factory :question_comment, class: Comment  do
    sequence(:body) {|n| "Comment Body #{n}" }
    association :author, factory: :user
    association :commentable, factory: :question
  end

  factory :answer_comment, class: Comment  do
    sequence(:body) {|n| "Comment Body #{n}" }
    association :author, factory: :user
    association :commentable, factory: :answer
  end

  factory :question_upvote, class: Vote  do
    value true
    association :user, factory: :user
    association :voteable, factory: :question
  end

end

class User < ActiveRecord::Base
  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments, foreign_key: :author_id

end

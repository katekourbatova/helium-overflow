class User < ActiveRecord::Base

has_many :votes, :questions, :answers
has_many :comments, through: :answers, source: :author_id

end

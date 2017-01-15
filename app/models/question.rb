class Question < ActiveRecord::Base
  include Voteable

  belongs_to :author, class_name: User
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  validates :title, :body, presence: true
end

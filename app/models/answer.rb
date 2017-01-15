class Answer < ActiveRecord::Base
  include Voteable
  
  belongs_to :question
  belongs_to :author, class_name: 'User'
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  validates :body, presence: true
end

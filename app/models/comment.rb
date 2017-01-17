class Comment < ActiveRecord::Base
  include Voteable

  belongs_to :commentable, polymorphic: true

  belongs_to :author, class_name: User
  has_many :votes, :as => :voteable

  validates :body, presence: true
  validates :author, presence: true
end

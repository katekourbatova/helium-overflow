class Comment < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :votes, :as => :voteable

  validates :body, presence: true
  validates :author, presence: true
end

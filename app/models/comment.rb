class Comment < ActiveRecord::Base

  belongs_to :author, class_name: User
  belongs_to :
  has_many :votes

  validates :author, :body, presence: true
end

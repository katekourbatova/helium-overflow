class Question < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :comments

  validates :title, :body, presence: true

end

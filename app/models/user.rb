require 'bcrypt'

class User < ActiveRecord::Base
<<<<<<< HEAD
  include BCrypt

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments, through: :answers, source: :author_id
  validates :username, :email, presence: true

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
=======
  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments, foreign_key: :author_id
>>>>>>> origin

  def self.authenticate(email, login_password)
    user = User.find_by(email: email)
    return nil unless user
    if user.password == login_password
      user
    else
      nil
    end
  end
end

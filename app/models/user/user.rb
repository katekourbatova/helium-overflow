require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :votes, :questions, :answers
  has_many :comments, through: :answers, source: :author_id
  validates :username, :email, presence: true

  def password
      @password ||= Password.new(self.password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

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




end

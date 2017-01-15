module Voteable
  def downvote(user)
    self.votes.create(value: false, user_id: user.id)
  end

  def upvote(user)
    self.votes.create(value: true, user_id: user.id)
  end

end

module Voteable
  def downvote(user_id)
    self.votes.create(value: false, user_id: user_id)
  end

  def upvote(user_id)
    self.votes.create(value: true, user_id: user_id)
  end

end

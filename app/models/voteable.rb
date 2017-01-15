module Voteable
  def downvote(user)
    delete_old_vote(user) if vote_exists?(user)
    self.votes.create(value: false, user_id: user.id)
  end

  def upvote(user)
    delete_old_vote(user) if vote_exists?(user)
    self.votes.create(value: true, user_id: user.id)
  end

  def get_type
    self.class.name
  end

  def delete_old_vote(user)
    vote = Vote.where(user_id: user.id, voteable_type: get_type, voteable_id: self.id)[0]
    Vote.destroy(vote.id)
  end

  def vote_exists?(user)
    return !Vote.where(user_id: user.id, voteable_type: get_type, voteable_id: self.id).empty?
  end
end

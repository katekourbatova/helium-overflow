module Voteable
  def downvote(user)
    @_vote = find_vote(user)
    @_vote.value = false
    puts 'saved' if !@_vote.value
  end

  def upvote(user)
    @_vote = find_vote(user)
    @_vote.value = true
    puts 'saved' if @_vote.value
  end

  def get_type
    self.class.name
  end

  def find_vote(user)
    Vote.find_or_initialize_by(user_id: user.id,
                               voteable_type: get_type,
                               voteable_id: self.id)
  end

end

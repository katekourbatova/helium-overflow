module Voteable
  def downvote(user)
    @_vote = find_vote(user)
    @_vote.value = false
  end

  def upvote(user)
    @_vote = find_vote(user)
    @_vote.value = true
  end

  def time_since_creation
    hours_number = ((Time.now - created_at) / 3600).round
    "#{hours_number} hours ago"
  end

  def get_score
    all_votes = self.votes
    all_votes.reduce(0) do  |sum, vote|
      sum += 1 if vote.value
      sum -= 1 if !vote.value
      sum
    end
  end

  def parent_question_id
    case Module.get_const(self.get_type)
    when Question
      return self.id
    when Answer
      return self.question_id
    when Comment
      return comment_parent_question_id
    end
  end

  def comment_parent_question_id
    comment_parent_class = Module.const_get(self.commentable_type)
    comment_parent_id = self.commentable_id
    comment_parent = comment_parent_class.find(comment_parent_id)
    case comment_parent_class
    when Question
      return comment_parent_id
    when Answer
      return comment_parent.parent_question_id
    end
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

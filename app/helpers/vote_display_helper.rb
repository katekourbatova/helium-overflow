helpers do
  def get_score(voteable)
    votes = voteable.votes
    votes.reduce(0) do  |sum, vote|
      sum += 1 if vote.value
      sum -= 1 if !vote.value
      sum
    end
  end

  def get_type(voteable)

  end
end

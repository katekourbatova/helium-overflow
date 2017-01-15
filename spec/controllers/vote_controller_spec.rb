require 'spec_helper'

describe 'votes controller' do
  let(:question) {Question.create(title: 'How do I type?', 
                                  body: 'I have no hands',
                                  author_id: User.first.id)}

  describe 'upvoting a question' do
    it 'redirects to the question' do
      post "questions/{question.id}/upvote"
      expect(last_response.status).to eq(302)
    end
    it 'increases the score of the question' do
      expect{post "questions/{question.id}/upvote"}.to change{get_score(question)}.by(1)
    end
  end

  describe 'downvoting a question' do
    it 'redirects to the question' do
      post "questions/{question.id}/downvote"
      expect(last_response.status).to eq(302)
    end
    it 'increases the score of the question' do
      expect{post "questions/{question.id}/downvote"}.to change{get_score(question)}.by(-11)
    end
  end
end
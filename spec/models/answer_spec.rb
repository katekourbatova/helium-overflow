require_relative '../spec_helper'

describe Answer do
  let(:answer){Answer.create!({body:'Your question has an answer', question_id: 1, author_id: 1})}
  let(:comment){Comment.create!({body:'This is a comment', commentable_type: 'Answer',commentable_id: answer.id})}

  it 'has a body' do
    expect(answer.body).to eq('Your question has an answer')
  end

  describe 'associations' do
    it 'has many comments' do
      expect(answer.comments).to include(comment)
    end
  end

  describe 'validations' do

  end
end

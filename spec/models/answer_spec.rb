require_relative '../spec_helper'

describe Answer do
  let(:answer_options) {{body:'Your question has an answer', question_id: 1, author_id: 1}}
  let(:answer){Answer.create!(answer_options)}
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
    let(:bodyless_answer) {Answer.new(answer_options.except(:body))}
    it 'requires a body' do
      expect(bodyless_answer).to be_invalid
    end
  end
end

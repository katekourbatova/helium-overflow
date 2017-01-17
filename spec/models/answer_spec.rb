require_relative '../spec_helper'

describe Answer do
  let(:answer_options) {{body:'Your question has an answer'}}
  let(:answer){FactoryGirl.create(:answer, answer_options)}
  let(:comment){FactoryGirl.create(:answer_comment, {commentable: answer, body:'This is a comment'})}

  it 'has a body' do
    expect(answer.body).to eq('Your question has an answer')
  end

  describe 'associations' do
    it 'has many comments' do
      expect(answer.comments).to include(comment)
    end
  end

  describe 'validations' do
    let(:bodyless_answer) {FactoryGirl.build(:answer, {:body => nil})}
    it 'requires a body' do
      expect(bodyless_answer).to be_invalid
    end
  end
end

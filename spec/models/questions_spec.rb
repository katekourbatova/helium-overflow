require_relative '../spec_helper'

describe Question do
  let(:question) {Question.create()}
  describe "a question can be created" do
    it 'has a title' do
      expect(question.title).to eq('Balloon exploded')
    end

    it 'has a body' do
      expect(question.body).to eq('How do you prevent a balloon from exploding?')
    end
  end
end

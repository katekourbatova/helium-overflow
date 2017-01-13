require_relative '../spec_helper'

describe Question do
  let(:question){Question.new({title: 'Balloon exploded',
                                    body: 'How do you prevent a balloon from exploding?'})}
  let(:titleless_question){
    Question.new(body: 'How do you prevent a balloon from exploding?')
  }
  let(:bodyless_question){
    Question.new(title: 'Balloon exploded')
  }

  describe "a question can be created" do
    it 'has a title' do
      expect(question.title).to eq('Balloon exploded')
    end

    it 'has a body' do
      expect(question.body).to eq('How do you prevent a balloon from exploding?')
    end
  end

  describe "VALIDATIONS" do
    it 'requires a title' do
       expect(titleless_question).to be_invalid
    end

    it 'requires a body' do
       expect(bodyless_question).to be_invalid
    end
  end
end

require_relative '../spec_helper'

describe Question do
  let(:question_options) {{ title: 'Balloon exploded',
                                    body: 'How do you prevent a balloon from exploding?',
                                    author_id: 1 }}
  let(:question){ Question.new question_options }

  describe "a question can be created" do
    it 'has a title' do
      expect(question.title).to eq('Balloon exploded')
    end

    it 'has a body' do
      expect(question.body).to eq('How do you prevent a balloon from exploding?')
    end
  end

  describe "associations" do
    let(:author){
      Author.new()
    }
    let(:answer_1){
      Answer.new({question_id: question.id})
    }
    let(:comment_1){
      Comment.new({ commentable_id: 1, commentable_type: 'Question' })
    }
    it 'belongs to an author' do
       expect(question.author).to eq(author)
    end

    it 'can have many answers' do
       expect(question.answers).to contain(answer_1)
    end

    it 'can have many comments' do
       expect(question.comments).to contain(comment_1)
    end

    it 'can have many votes' do
       expect(question.votes).to contain(vote_1)
    end
  end

  describe "validations" do
    let(:titleless_question){
      Question.new question_options.except(:title)
    }
    let(:bodyless_question){
      Question.new question_options.except(:body)
    }
    let(:authorless_question){
      Question.new question_options.except(:author_id)
    }
    it 'requires a title' do
       expect(titleless_question).to be_invalid
    end

    it 'requires a body' do
       expect(bodyless_question).to be_invalid
    end
  end
end

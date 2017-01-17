require_relative '../spec_helper'

describe Question do

  let(:question_options) {{ title: 'Balloon exploded',
                                    body: 'How do you prevent a balloon from exploding?'}}
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

    let(:questioner){ FactoryGirl.create(:user) }

    let(:answerer){ FactoryGirl.create(:user) }

    let(:commenter){ FactoryGirl.create(:user) }

    let(:question){ FactoryGirl.create(:question, author: questioner) }

    let(:answer){ FactoryGirl.create(:answer, question: question, author: answerer) }

    let(:comment){ FactoryGirl.create(:question_comment, commentable: question, author: commenter) }

    let(:comment_other){ FactoryGirl.create(:question_comment) }

    let(:vote){ FactoryGirl.create(:question_upvote, voteable: question, user: commenter) }

    it 'belongs to an author' do
       expect(question.author).to eq(questioner)
    end

    it 'can have many answers' do
       expect(question.answers).to include(answer)
    end

    it 'can have many comments' do
       expect(question.comments).to include(comment)
    end

    it 'can have its own comments comments' do
       expect(question.comments).to_not include(comment_other)
    end

    it 'can have many votes' do
       expect(question.votes).to include(vote)
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

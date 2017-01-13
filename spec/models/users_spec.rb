require_relative '../spec_helper'

describe User do
  let(:user) {User.new({username: 'XxIuSeAiMxX',
                       email: 'roflcopter@aol.com',
                       password: 'ilovemywalkman'})}


  describe "user creation" do
    it 'has a username' do
      expect(user.username).not_to be_empty
    end

    it 'has a hashed password' do
      expect(user.password_hash).not_to eq('ilovemywalkman')
    end
  end

  describe "VALIDATIONS" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_hash) }
  end
end

require_relative '../spec_helper'

describe User do
  let(:user) {User.new({username: 'XxIuSeAiMxX',
                       email: 'roflcopter@aol.com',
                       password_hash: 'ilovemywalkman'})}
  let(:user2) {User.new({username: '',
                        email: '',
                        password_hash: ''})}

  describe "user creation" do
    it 'has a username' do
      expect(user.username).not_to be_empty
    end

    it 'has a hashed password' do
      expect(user.password_hash).not_to eq('ilovemywalkman')
    end
  end

  describe "VALIDATIONS" do
    it 'requires a username' do
       expect(user2.username).to be_invalid
    end

    it 'requires an email' do
       expect(user2.username).to be_invalid
    end
  end
end

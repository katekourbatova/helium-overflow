require 'spec_helper'

describe Vote, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:voteable) }
end

describe Vote, type: :model do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:voteable_id) }
    it { should validate_presence_of(:voteable_type) }
end

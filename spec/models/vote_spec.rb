require 'spec_helper'

describe Vote, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:comment)}
  it {should belong_to(:question)}
  it {should belong_to(:answer)}
end

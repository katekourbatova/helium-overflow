require_relative '../spec_helper'

describe Answer do
  let(:answer){Answer.new({body:'Your question has an answer'})}

  it 'has a body' do
    expect(answer.body).to eq('Your question has an answer')
  end
end

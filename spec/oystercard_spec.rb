require 'oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:balance)}

  it 'shows the initial balance of the card' do
    expect(subject.balance).to eq 0
  end
end

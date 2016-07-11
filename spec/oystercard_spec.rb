require 'oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:exceeds_limit?).with(1).argument}
  it {is_expected.to respond_to(:deduct).with(1).argument}

  it 'should deduct fare from the balance' do
    expect {subject.deduct 5}.to change {subject.balance}.by -5
  end

  it 'shows the initial balance of the card' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it 'should increase the balance by 10' do
      expect{subject.top_up 10}.to change {subject.balance}.by 10
    end

    it "raises an error when top up exceeds card limit: #{Oystercard::MAXIMUM_BALANCE}" do
      subject.top_up Oystercard::MAXIMUM_BALANCE
      expect{subject.top_up 1}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end

    it "raises an error when top up exceeds card limit: #{Oystercard::MAXIMUM_BALANCE}" do
      subject.top_up 20
      expect{subject.top_up 90}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

end

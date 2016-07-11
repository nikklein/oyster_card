require 'oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:exceeds_limit?).with(1).argument}
  it {is_expected.to respond_to(:deduct).with(1).argument}
  it {is_expected.to respond_to(:touch_in)}
  it {is_expected.to respond_to(:in_journey?)}
  it {is_expected.to respond_to(:touch_out)}

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

  it 'returns false (not in journey) when new card created' do
    expect(subject.in_journey?).to be false
  end

  describe '#touch_in' do
    it 'returns true (in journey) when touched in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'returns false (in journey) when touched out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end

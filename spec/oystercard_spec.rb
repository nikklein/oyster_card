require 'oystercard'

describe Oystercard do
<<<<<<< HEAD
  subject(:card) {described_class.new}
  
  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'top_up' do

  end
=======

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
      subject.top_up 10
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "raises an error if balance is below #{Oystercard::MINIMUM_BALANCE}" do
      expect {subject.touch_in}.to raise_error "Insufficient funds. Minimum balance: #{Oystercard::MINIMUM_BALANCE}"
    end

  end

  describe '#touch_out' do
    it 'returns false (in journey) when touched out' do
      subject.top_up 10
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

>>>>>>> 8a7f73293df6a42bac66c2d38f6e59c8c4d8680d
end

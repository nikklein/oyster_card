require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe 'initialize' do

    it 'check new card\'s balance' do
      expect(subject.balance).to eq(DEFAULT_BALANCE)
    end

  end

  describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument}

      it 'increases the balance by the top up amount' do
        expect{subject.top_up(10)}.to change{ subject.balance }.by 10

      end

      it 'will not allow a balance greater than 90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect {subject.top_up(1)}.to raise_error "Balance can not be greater than #{maximum_balance}"
      end

  end

  describe '#deduct' do
    it {is_expected.to respond_to(:deduct).with(1).argument}

    it 'reduces the balance' do
      subject.top_up(20)
      expect {subject.deduct(5)}.to change{subject.balance}.by -5
    end
  end

  describe '#touch_in' do
    it "touches in" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it "touches out" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  describe '#in_journey?' do
    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

  end
end

require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:station) {double :station}
  CREDIT = 10

  describe 'initialize' do

    it 'check new card\'s balance' do
      expect(subject.balance).to eq(Oystercard::DEFAULT_BALANCE)
    end

  end

  describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument}

      it 'increases the balance by the top up amount' do
        expect{subject.top_up(CREDIT)}.to change{ subject.balance }.by CREDIT

      end

      it 'will not allow a balance greater than 90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect {subject.top_up(1)}.to raise_error "Balance can not be greater than #{maximum_balance}"
      end

  end

  describe '#touch_in' do
    it "touches in" do
      subject.top_up(CREDIT)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "raises an error if balance is less than minimum fare" do
      expect {subject.touch_in(station)}.to raise_error "Insufficent funds"
    end

    it "stores the entry station" do
      subject.top_up(CREDIT)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch_out' do

before(:each)do
@minimum_fare = Oystercard::MINIMUM_FARE
subject.top_up(CREDIT)
subject.touch_in(station)
subject.touch_out
end

    it "touches out" do
      expect(subject).not_to be_in_journey
    end

    it "deducts fare" do
      expect{subject.touch_out}.to change{subject.balance}.by(- @minimum_fare)
    end
  end

  describe '#in_journey?' do
    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

  end
end

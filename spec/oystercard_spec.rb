require 'oystercard'
require 'journey'

describe OysterCard do
  subject(:card) {described_class.new}
  let(:station) {double :station}

  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(card.balance).to eq(0)
    end
  end


  describe '#top_up' do

    it 'when top_up it changes the balance' do
      expect{card.top_up(10)}.to change{card.balance}.by 10
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      message = "Max balance of £#{maximum_balance} exceeded"
      expect{card.top_up(91)}.to raise_error message
    end
  end



describe '#touch_in' do

    it 'Adds start station' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.journeylog.current_journey.entry_station).to eq station
    end

    it 'raises an error if card has insufficient balance' do
        message = "Card has insufficient balance"
        expect{card.touch_in(station)}.to raise_error message
    end

    it 'when touched in twice it charges penalty fare' do
      subject.top_up 20
      subject.touch_in station
      expect{ subject.touch_in(station) }.to change{ subject.balance }.by(-OysterCard::PENALTY_FARE)
    end
end

 describe '#touch_out' do
    it 'when touched out twice it charges penalty fare' do
      subject.top_up 20
      subject.touch_out station
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-OysterCard::PENALTY_FARE)

 end

    it 'when you complete a journey charges minimum fare' do
      subject.top_up 20
      subject.touch_in station
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-OysterCard::MINIMUM_FARE)
    end
end


end

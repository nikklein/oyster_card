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

    it 'raises an error if card has insufficient balance' do
        message = "Card has insufficient balance"
        expect{card.touch_in(station)}.to raise_error message
      end

describe 'touch_in' do
  it 'creates a journey and adds start station' do
    subject.top_up(10)
    expect(subject.touch_in(station)).to eq station
    end
end

#charge on touch out
#subject.touch_in
#expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
  #  describe '#deduct'

  #  it 'when touch_out it deducts amount' do
  #    card.touch_in(station)
  #    min_fare = OysterCard::MINIMUM_FARE
  #    expect{card.touch_out(station)}.to change{card.balance}.by(- min_fare )
  #  end


  #  it 'can touch in' do
  #    card.touch_in(station)
  #    expect(card).to be_in_journey
#    end


#    it 'can touch out' do
#      card.touch_in(station)
#      card.touch_out(station)
#      expect(card).not_to be_in_journey
#    end


  #  it 'stores the station entry' do
  #    expect(card.touch_in(station)).to eq station
  #  end

  #  it 'has an empty list of journeys by default' do
  #    expect(card.journeys).to be_empty
  #  end

  #  let(:journey){ {begining_station: station, final_station: station} }

  #  it 'stores a journey' do

  #    card.touch_in(station)
  #    card.touch_out(station)
  #    expect(card.journeys.size).to eq(1)
  #  end
  #end

end

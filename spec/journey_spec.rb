require 'journey'
require 'oystercard'

describe 'Journey' do

  let(:station) {double :station, zone: 1}
  let(:stationthree) {double :station, zone: 3}
  let(:stationfive) {double :station, zone: 5}
  subject(:journey) {Journey.new(station)}
  let(:card) { OysterCard.new }

  describe '#fare' do
    before do
      card.top_up 5
    end

  it 'returns the minimum fare when stations in same zone' do
     subject.final_station(station)
      expect(subject.fare).to eq 1
  end

  it 'returns the correct fare when stations are in different zones' do
      subject.final_station(stationthree)
      expect(subject.fare).to eq 3
  end

  it 'returns the correct fare when stations are in different zones' do
      journey = Journey.new(stationfive)
      journey.final_station(station)
      expect(journey.fare).to eq 5
  end

  end
end

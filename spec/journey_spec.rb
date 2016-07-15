require 'journey'
require 'oystercard'

describe 'Journey' do

  let(:station) {double :station}
  subject(:journey) {Journey.new}
  let(:card) { OysterCard.new }

  describe '#fare' do
    before do
      card.top_up 5
    end

  it 'returns the minimum fare' do
     subject.final_station(station)
       expect(subject.fare).to eq 6
     end

  end
end

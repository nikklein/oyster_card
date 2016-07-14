require 'journey'
require 'oystercard'

describe 'Journey' do
  subject(:card) {OysterCard.new}
#  subject(:journey) {Journey.new}
  let(:station) {double :station}

  describe '#fare' do
    before do
      card.top_up 5
    end

    it 'returns the minimum fare' do
      card.touch_in(station)
      card.touch_out(station)
      expect(subject.fare).to eq OysterCard::MINIMUM_FARE
    end
    it 'returns penalty fair if journey did not start' do
      card.touch_in(station)
      expect(subject.fare).to eq OysterCard::PENALTY_FARE
    end
    it 'returns penaly fare if journey did not end' do
      card.touch_out(station)
      expect(subject.fare).to eq OysterCard::PENALTY_FARE
    end
  end
end

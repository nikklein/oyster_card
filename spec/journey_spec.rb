require 'journey'
require 'oystercard'

describe 'Journey' do

  let(:station) {double :station}
  subject(:journey) {Journey.new(station)}
  let(:card) { OysterCard.new }

  describe '#fare' do
    before do
      card.top_up 5
    end

  it 'returns the minimum fare' do
     subject.final_station(station)
       expect(subject.fare).to eq 1
     end

  it 'returns penalty fair if journey did not start' do
     expect(subject.fare).to eq 6
   end

  it 'returns penaly fare if journey did not end' do
    expect(subject.fare).to eq 6
    
    end
  end
end

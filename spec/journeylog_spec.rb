require 'journeylog'

describe JourneyLog do

subject { described_class.new(journey_class: journey_class) }
let(:journey){double :journey}
let(:station){double :station}
let(:journey_class){double :journey_class, new: journey}


  describe '#start' do
    it 'creates a journey with an entry station' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end
  end

  describe '#finish' do
    it 'should add an exit station to current journey' do

    end
  end

end

require 'station'

describe Station do

  subject {described_class.new(name: "Brockley", zone: 2)}


  it 'shows the station name' do
    expect(subject.name).to eq("Brockley")
  end

  it 'shows the station zone' do
    expect(subject.zone).to eq(2)
  end

end

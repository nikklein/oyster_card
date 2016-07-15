require './lib/oystercard'
=begin
card = OysterCard.new
card.top_up(50)
card.touch_in("London Bridge")
card.touch_out("Bank")

describe 'Feature tests' do
  it 'User tops up then goes on a valid journey, correct amount is deducted' do
    card = OysterCard.new
    card.top_up(50)
    card.touch_in('St1')
    card.touch_out('St2')
    expect(card.balance).to eq(49)
    #better say card balance chaned by whatever min fare is Oystercard::MIN_FARE
  end
end
=end

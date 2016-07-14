require './lib/oystercard'

card = OysterCard.new
card.top_up(50)
card.touch_in("London Bridge")
card.touch_out("Bank")

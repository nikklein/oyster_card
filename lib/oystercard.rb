

class Oystercard
  attr_reader :balance, :entry_station


  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Balance can not be greater than #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end


  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insufficent funds" if @balance < MINIMUM_BALANCE
    @entry_station = station

  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

private

  def deduct(amount)
    @balance -= amount
  end

end

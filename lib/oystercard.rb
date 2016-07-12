

class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Balance can not be greater than #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end

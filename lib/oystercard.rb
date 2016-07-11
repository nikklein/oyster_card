
class Oystercard

  attr_reader :balance, :limit, :in_journey

  MAXIMUM_BALANCE = 90

  def initialize(limit = MAXIMUM_BALANCE)
    @balance = 0
    @limit = limit
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_limit?(amount)
    @balance += amount
    "Your balance is now £#{balance}"
  end

  def deduct(fare)
    @balance -= fare
    "Your balance is now £#{balance}"
  end

  def exceeds_limit?(amount)
    @balance + amount > limit
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

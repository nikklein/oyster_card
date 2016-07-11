
class Oystercard

  attr_reader :balance
  attr_reader :limit

  MAXIMUM_BALANCE = 90

  def initialize(limit = MAXIMUM_BALANCE)
    @balance = 0
    @limit = limit
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_limit?(amount)
    @balance += amount
    "Your balance is now £#{balance}"
  end

  def exceeds_limit?(amount)
    @balance + amount > limit
  end

end

=======

class Oystercard

  attr_reader :balance, :limit, :in_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

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

  def min_balance?
    @balance < MINIMUM_BALANCE
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds. Minimum balance: #{Oystercard::MINIMUM_BALANCE}" if min_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
>>>>>>> 8a7f73293df6a42bac66c2d38f6e59c8c4d8680d

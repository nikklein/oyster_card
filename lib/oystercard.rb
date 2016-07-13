require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1

  def initialize(balance = 0)
    @balance = balance
    @journeys = Array.new
  end

  def top_up amount
    fail "Max balance of £#{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @journey.in_journey?
  end

  def touch_in(station)
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    @journey = Journey.new
    @journeys << @journey
    @journey.begining_station(station)
  end

  def touch_out(station)
    deduct MINIMUM_FARE
    @journey.final_station(station)
    @journey = nil
  end

  private

  def deduct amount
    @balance -= amount
  end
end

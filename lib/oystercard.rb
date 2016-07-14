require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1
  PENALTY_FARE    = 6

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up amount
    fail max_balance_message if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail min_balance_message if min_balance?
    journey = Journey.new
    journey.begining_station(station)
    @journeys << journey
    station
  end

  def in_journey?
    @journeys[-1].in_journey?

  end

  def touch_out(station)
    #journey2 = Journey.new if @journeys.nil?
    deduct MINIMUM_FARE
    @journeys.last.final_station(station)
  end


  def min_balance_message
    "Card has insufficient balance"
  end

  def max_balance_message
    "Max balance of £#{MAXIMUM_BALANCE} exceeded"
  end

  def min_balance?
    @balance < MINIMUM_BALANCE
  end

  private

  def deduct amount
    @balance -= amount
  end

end

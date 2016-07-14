require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1
  PENALTY_FARE    = 6

  def initialize(balance = 0)
    @balance = balance
    @journey_log = []

  end

  def top_up amount
    fail max_balance_message if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail min_balance_message if min_balance?
    new_journey.begining_station(station)
    @journey_log << journey
    station
  end

  def in_journey?
    @journey_log[-1].in_journey?

  end

  def touch_out(station)
    if new_journey.empty?
      new_journey
    #journey2 = Journey.new if @journeys.nil?
    deduct MINIMUM_FARE
    @journey_log.last.final_station(station)
  end

  def new_journey
    journey = Journey.new
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

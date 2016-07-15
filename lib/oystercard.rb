require './lib/journey'
require_relative 'journeylog'
require_relative 'station'

class OysterCard
  attr_reader :balance, :entry_station, :journey, :journeylog

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1
  PENALTY_FARE    = 6

  def initialize(balance = 0)
    @balance = balance
    @journeylog = JourneyLog.new
  end

  def top_up amount
    fail_mesage = "Max balance of £#{MAXIMUM_BALANCE} exceeded"
    fail fail_mesage if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    if !@journeylog.current_journey.nil?
      deduct(PENALTY_FARE)
    end
    @journeylog.start(station)
  end

  def journeys
    @journeylog.journeys.dup
  end


  def touch_out(station)
    @journeylog.finish(station)
    deduct @journeylog.current_journey.fare
    reset
  end

  private

  def deduct amount
      @balance -= amount

  end

  def reset
    @journeylog.current_journey = nil
  end
end

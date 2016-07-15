require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1
  PENALTY_FARE    = 6

  def initialize(balance = 0)
    @balance = balance
    @journey = Journey.new

  end

  def top_up amount
    fail_mesage = "Max balance of £#{MAXIMUM_BALANCE} exceeded"
    fail fail_mesage if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    if !@journey.journey.empty?
      deduct(PENALTY_FARE)
    end
    @journey.start_station(station)
    end


  def touch_out(station)
    @journey.final_station(station)
    deduct @journey.fare

  end


  def in_journey?
    @journey.in_journey?

  end

  private

  def deduct amount
      @balance -= amount
      @journey.journey_history << @journey.journey
      reset

  end

  def reset
      @journey.journey = {}
      @journey.entry_station = nil
      @journey.exit_station = nil
  end


end

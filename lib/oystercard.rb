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
    fail "Max balance of £#{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Card has insufficient balance" if @balance < MINIMUM_BALANCE
    return deduct @journey.fare if !@journey.journey.empty?
    @journey.start_station(station)

  end


  def touch_out(station)
    #return deduct @journey.fare if @journey.journey.empty?
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
      @journey.journey = {}
      #@entry_station = nil
      #@exit_station = nil
  end




end

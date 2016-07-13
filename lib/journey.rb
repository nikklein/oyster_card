require_relative 'station'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def exit_station(exit_station)
    @exit_station = exit_station
  end
def route
  @route = []
  @route << @entry_station
  @route << @exit_station
  @route
end
  def fare
   route.size == 2 ? MINIMUM_FARE : PENALTY_FARE
  end

end

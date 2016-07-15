require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journeys

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << @current_journey if !@current_journey.nil?
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @exit_station = current_journey.final_station(station)
    @journeys << @current_journey
    @current_journey = nil
  end

  private

  def current_journey
    @current_journey || @current_journey = journey_class.new
  end

end

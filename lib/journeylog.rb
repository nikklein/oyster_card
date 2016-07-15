require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journeys
  attr_accessor :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << @current_journey if !@current_journey.nil?
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @exit_station = current_journey_method.final_station(station)
    @journeys << @current_journey
  end

  private

  def current_journey_method
    @current_journey || @current_journey = journey_class.new
  end

end

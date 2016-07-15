
require_relative 'oystercard'
class Journey
    attr_reader  :exit_station, :journey_history, :complete
    attr_accessor :entry_station, :exit_station,:journey

    def initialize
      @exit_station = nil
      @journey_history = []
      @journey = {}
    end

    def start_station(station)
      @entry_station = station
      @journey[station] = nil

    end

    def final_station(station)
    @exit_station = station
    @journey[@entry_station] = @exit_station

    end

    def in_journey?
      @exit_station.nil?
    end

    def complete?
      !!@entry_station && !!@exit_station
    end


    def fare
      complete? ? OysterCard::MINIMUM_FARE : OysterCard::PENALTY_FARE

    end
end

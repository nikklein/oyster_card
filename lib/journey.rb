
require_relative 'oystercard'
class Journey

    attr_reader :journey_history, :complete
    attr_accessor :entry_station, :exit_station, :journey

    def initialize(station = nil)
      @entry_station = station
      @exit_station = nil
    end

    def final_station(station)
    @exit_station = station
    end

    def in_journey?
      @exit_station.nil?
    end

    def complete?
      !!@entry_station && !!@exit_station
    end

    def fare
      if complete?
        if @entry_station.zone > @exit_station.zone
          (@entry_station.zone + @exit_station.zone) - 1
        else
          (@exit_station.zone - @entry_station.zone) + 1
        end
      else
        OysterCard::PENALTY_FARE
      end
    end

end

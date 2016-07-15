
require_relative 'oystercard'
class Journey
    attr_reader  :exit_station, :journey_history, :complete
    attr_accessor :entry_station, :journey

    def initialize
      @exit_station = nil
      @journey_history = []
      @journey = {}
    end

    def start_station(station)
      @entry_station = station
      @journey[@entry_station] = nil

    end



    def final_station(station)
    @exit_station = station
    @journey[@entry_station] = @exit_station
    
    #@exit_station = nil

    end

    def in_journey?
      @exit_station.nil?
    end


    def fare
      #return  if !!@entry_station && @complete == true
      OysterCard::PENALTY_FARE if !@journey.include? nil and !@journey.empty?
      OysterCard::MINIMUM_FARE

    end
end

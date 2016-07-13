

class Journey

  attr_reader :journeys


    def in_journey?
      !@journeys.last.include?(:exit_station)
    end

    def begining_station(station)
      @journeys << {entry_station: station}
      station
    end

    def final_station(station)
      @journeys.last.store(:exit_station, station)
    end

end

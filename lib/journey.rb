

class Journey
    attr_reader :begining_station, :final_station

    def in_journey?
      @final_station.nil?
    end

    def begining_station(station)
      @begining_station = station
    end

    def final_station(station)
      @final_station = station
    end

end

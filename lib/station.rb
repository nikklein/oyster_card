class Station
  attr_reader :name, :zone, :stations

  def initialize(station)
    @name = station[:name]
    @zone = station[:zone]
  end


end

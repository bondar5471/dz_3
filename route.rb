class Route
  attr_accessor :stations

  def initialize (start_stations, end_stations)
    @stations = [start_stations, end_stations]
  end
  def add_stations(stations)
    stations.insert(-2, stations)
  end
  def dell_stations(stations)
    stations.delete(stations)
  end
  def print_list_stations
    p @stations
  end

end
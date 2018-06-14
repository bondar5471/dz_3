#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_accessor :stations
  def initialize (start_stations, end_stations)
    @stations = [start_stations, end_stations]
  end
  def add_stations(station)
    stations.insert(-2, station)
  end
  def dell_stations(station)
    stations.delete(station)
  end
  def print_list_stations
    p @stations
  end

end


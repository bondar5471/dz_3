#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной
class Route
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
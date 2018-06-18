#Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
#Может набирать скорость
#Может показывать текущую скорость
#Может тормозить (сбрасывать скорость до нуля)
#Может показывать количество вагонов
#Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
#Может принимать маршрут следования (объект класса Route)
#Может перемещаться между станциями, указанными в маршруте. Показывать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  attr_accessor :number, :type, :carriages, :speed, :route

  def initialize (number, type, carriages )
    @number = number
    @speed = 0
    @type = type
    @carriages = carriages
    @route = nil
  end

  def acceleration (speed = 20)
    @speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_carriages (carriage)
    self.carriages +=1 if speed.zero? && carriage.type == type
  end

  def dell_carriages
    self.carriages -=1 if speed.zero?
  end

  def add_route(route)
    self.route = route
  end

  def current_station
    route.stations[current_station_index]
  end

  def next_station
    route.stations[current_station_index + 1]
  end

  def prev_station
    route.stations[current_station_index - 1] if current_station_index >= 1
  end

end

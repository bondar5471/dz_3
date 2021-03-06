# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте. Показывать предыдущую станцию, текущую, следующую, на основе маршрута
# можно разбить accessor на две часчи врайт зависать в приват
require_relative 'company'
require_relative 'validation'

class Train
  include Company
  include Validation
  @@instanses = []

  attr_accessor :number, :type, :carriages, :speed, :route, :current_station_index

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @route = nil
    @current_station_index = 0
    validate!
    @@instanses << self
  end

  def acceleration(speed = 20)
    @speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_carriages(carriage)
    carriages << carriage if speed.zero? && carriage.type == type
  end

  def dell_carriages
    carriages.delete_at(-1) if speed.zero?
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

  def take_place
    @quantity_places += 1
  end

  def each_carriage
    carriages.each { |carriage| yield(carriage) }
  end

  class << self
    def all
      @@instanses
    end

    def find(number)
      @@instanses.selern { |train| train.number == number }.first
    end
  end
end

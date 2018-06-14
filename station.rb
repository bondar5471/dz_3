#Имеет название, которое указывается при ее создании
#Может принимать поезда (по одному за раз)
#Может показывать список всех поездов на станции, находящиеся в текущий момент
#Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
class Station
  attr_accessor :name
  attr_accessor :trains
  def initialize (name)
    @name = name
    @trains = []
  end
  def add_train (train)
    self.trains << train
  end
  def dell_train(train)
    trains.delete (train)
  end
  def print_list_train
    p @trains
  end
end

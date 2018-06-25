#Имеет название, которое указывается при ее создании
#Может принимать поезда (по одному за раз)
#Может показывать список всех поездов на станции, находящиеся в текущий момент
#Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
require_relative 'company'

class Station
  include Company
  
  attr_accessor :name, :trains, :type

  @@instanses = 0

  def initialize (name)
    @name = name
    @trains = []
    @type = nil
    @pass = 0
    @carrg = 0
    @@instanses +=1

  end

  def self.instanses
    @@instanses
  end

  def add_train (train)
    self.trains << train
    if train.type == 'pass'
      @pass +=1
    elsif train.type == 'carrg'
      @carrg += 1
    end

  end

  def dell_train(train)
    trains.delete (train)
    if train.type == 'pass'
      @pass -=1
    elsif train.type == 'carrg'
      @carrg -= 1
    end
  end

  def print_list_train
    p @trains
  end

  def print_list_type
    p "Pass #{ @pass }, Carrg #{ @carrg }"
  end

  def trains_list
    self.trains.map(&:number).join(' ')
  end

  def train_list_by_type
    self.trains.select { |c_train| c_train.type == type }.join(' ')
  end

  def all
    @@instanses
  end
end

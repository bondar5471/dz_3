# Создавать станции
# Создавать поезда
# Добавлять вагоны к поезду
# Отцеплять вагоны от поезда
# Помещать поезда на станцию
# Просматривать список станций и список поездов на станции
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'

class Main

  attr_accessor :stations, :trains

  def initialize
    @stations = []
    @trains = []
  end

  def text_ui
  loop do

    action = choose_action

    break if action == 0
    case action
    when 1
      create_station
    when 2
      create_train
    when 3
      add_carriage
    when 4
      dell_carriage
    when 5
      add_train_to_station
    when 6
      train_on_station
    else
      puts 'Неверный код операции'
    end
      end
  end

  private

  def train_on_station
    station = choose_station
    return puts 'Нет такой станции' unless station
    puts "Список поездов на станции #{ station.name }: #{ station.trains_list }"
  end

  def add_train_to_station
    station = choose_station
    return puts 'Нет такой станции' unless station
    train = choose_train
    return puts 'Нет такого поезда' unless train
    station.add_train(train)
    puts "Поезд #{train.number} добавлен на станцию #{ station.name }"
  end

  def choose_station
    puts "Список станций #{ station_list }"
    puts 'Введите имя станции'
    station_name = gets.chomp
    station_by_name(station_name)
  end

  def station_list
    self.stations.map(&:name).join('')
  end

  def station_by_name(name)
    self.stations.select{ |station| station.name == name }.first
  end

  def dell_carriage
    train = choose_train
    train.dell_carriages
    puts 'Вагон отцепили'
  end

  def add_carriage
    train = choose_train

    if train
      case train.type
      when :passenger_train
      train.add_carriage
      puts 'Пассажирский вагон добавлен'
      when :cargo_trains
        train.add_carriage
      puts 'Пассажирский вагон добавлен'
      end
    end
  end

  def choose_train
    puts "Список поездов #{trains_list}"
    puts 'Введите номер поезда'
    train_number = gets.chomp
    train_by_number(train_number)
  end

  def train_by_number(number)
  self.trains.select { |train| train.number == number }.first
  end

  def create_train ##Создать поезд
    puts %q(Введите тип поезда который хотите создать!
      1 - Пасажирский
      2 - Товарный
    )

    train_type = gets.chomp.to_i
    puts 'Введите номер поезда'
    train_number = gets.chomp
    case train_type

    when 1
      trains << PassengerTrain.new(train_number)
      puts "Пасажирский поезд создан c номером #{train_number}!"
    when 2
      trains << CargoTrain.new(train_number)
      puts "Грузовой поезд создан c номером #{train_number}!"
    else
      'Не верный код'
    end
  end
#Создать станцию

  def create_station
  puts "Введите название станции"
  station_name = gets.chomp
  stations << Station.new(station_name)
  puts "Станция #{ station_name } создана"
  end

  def trains_list(type = nil)
    if type
      self.trains.map{ |t| t.number if t.type == type }.compact.join(' ')
    else
      self.trains.map(&:number).join(' ')
    end
  end

  def choose_action
    puts %Q(
    0 - Выход
    1 - Создать стацию
    2 - Создать поезд
    3 - Добавить вагон
    4 - Удалить вагон
    5 - Поместить поезд на станию
    6 - Просмотреть список станций и список поездов
         )
    gets.chomp.to_i
  end
end

Main.new.text_ui

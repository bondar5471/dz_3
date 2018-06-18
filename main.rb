require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'

def create_station #Создать станцию
  puts "Введите название станции"
  station_name = gets.chomp
  stations << Station.new (station_name)
  puts "Станция #{station_name} создана"
end


def create_train ##Создать поезд
  puts 'Введите тип поезда который хотите создать!
      1 - Пасажирский
      2 - Товарный
    '
  train_type = gets.chomp.to_i
  puts 'Введите номер поезда'
  train_number = gets.chomp
  case train_type
  when 1
    trains << PassengerTrain.new(train_number)
    puts "Пасажирский поезд успешно создан c номером #{train_number}!"
  when 2
    trains << CargoTrain.new(train_number)
    puts "Грузовой поезд успешно создан c номером #{train_number}!"
  else
    'Не верный выбор'
  end
end





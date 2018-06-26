module Validation
  def validate!
    raise "Номер не должен быть пустым" if number.nil?
    raise "Номер не должен быть меньше 6 симоволов" if number.length <= 6
    raise "Формат номера не подходит" if numder != /^(\d|[a-z]){3}-?((\d{2})|([a-z]{2}))$/i
    raise "Имя станции не можеть быть меньше 3 символов" if name.length < 3
    true
  end
end
module Validation

  NUMBER_FORMAT = /^([a-z0-9]){3}-*([a-z0-9]{2})$/i

  protected

  def validate!
    raise "Номер не должен быть пустым" if number.nil?
    raise "Номер не должен быть меньше 5 симоволов" if number.length < 5
    raise "Формат номера не подходит" if number !~ NUMBER_FORMAT
    true
  end

  def valid?
    validate!
  rescue
    false
  end
end

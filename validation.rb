module Validation
  def validate!
    raise "Номер не должен быть пустым" if number.nil?
    raise "Номер не должен быть меньше 4 симоволов" if number.length < 4
    true
  end
end
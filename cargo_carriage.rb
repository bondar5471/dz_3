class CargoCarriage < Carriage

  attr_accessor :total_volume, :taken_volume

  def initialize(total_volume)
    @total_volume = total_volume
    @taken_volume = 0
  end

  def take_volume(volume)
    self.taken_volume += total_volume - volume >= taken_volume
  end

  def available_volume
    self.total_volume - taken_volume
  end

  def type
    :cargo
  end
end

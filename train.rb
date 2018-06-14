class Train
  attr_accessor :speed
  attr_accessor :wagons
  def initialize (number)
    @number = number
    @speed = 0
    @type = type
    @carriages = []
    @route = nill
  end
  def acceleration (speed = 20)
    self.speed = speed
  end
  def stop
    self.speed = 0
  end
  def add_carriages (carriage)
    carriages << carriage if speed.zero? && carriage.type == type
  end
  def dell_carriages
    carriages.delete_at(-1) if speed.zero?
  end
  def add_route(route)
    self.route = route
  end
end



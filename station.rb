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
  def print_list_train
    p @trains
  end
end
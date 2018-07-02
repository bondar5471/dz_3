class PassengerCarriage < Carriage
  attr_accessor :seats_count, :taken_seats

  def initialize(seats_count)
    @seats_count = seats_count
    @taken_seats = 0
  end

  def taken_a_seat
    self.taken_seats += 1 if taken_seats < seats_count
  end

  def fre_places
    seats_count - self.taken_seats
  end

  def type
    :passenger
  end
end

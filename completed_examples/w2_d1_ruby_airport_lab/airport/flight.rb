class Flight

  attr_reader :number_of_seats
  attr_accessor :passengers, :destination

  def initialize(number_of_seats, destination)
    @number_of_seats = number_of_seats
    @destination     = destination
    @passengers      = []
  end

  def add_passenger(passenger)
    passengers << passenger
  end

  def to_s
    "#{destination} with #{number_of_seats} passengers."
  end

end
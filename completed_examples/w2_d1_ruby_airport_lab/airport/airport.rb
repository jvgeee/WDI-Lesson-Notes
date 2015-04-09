class Airport

  attr_reader :name
  attr_accessor :flights

  def initialize(name)
    @name  = name
    @flights = []
  end

  def add_flight(number_of_seats, destination)
    flights << Flight.new(number_of_seats, destination)
  end

end
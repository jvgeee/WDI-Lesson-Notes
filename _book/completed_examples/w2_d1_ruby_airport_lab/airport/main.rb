require_relative 'airport'
require_relative 'flight'
require_relative 'passenger'

airport = Airport.new("London Heathrow")

def menu
  puts `clear`
  puts "*** Welcome to Heathrow Airport ***\n\n"
  puts '1 : Add a flight'
  puts '2 : List flights'
  puts '3 : Add passenger to flight'
  puts '4 : List passengers of a flight'
  puts "Q : Quit\n\n"
  print '--> '
  gets.chomp
end

def list_flights(airport)
  airport.flights.each_with_index do |flight, index|
    puts "#{index}.\t#{flight}"
  end
end

def list_passengers(flight)
  flight.passengers.each_with_index do |passenger, index|
    puts "#{index}. #{passenger.name}"
  end
end

response = menu

while response.upcase != 'Q'
  case response
  when '1' # Add a flight
    puts "How many passengers are on this flight?"
    number_of_passengers = gets.chomp.to_i
    puts "What is the flight's destination?"
    destination = gets.chomp
    puts airport.add_flight(number_of_passengers, destination)
    gets

  when '2' # List flights
    puts "Here is a list of the flights:"
    list_flights(airport)
    gets

  when '3' # Add passenger to flight
    puts "What is the passenger name?"
    name = gets.chomp
    passenger = Passenger.new(name)

    puts "What flight do you want to add a passenger to?"
    list_flights(airport)
    flight_number = gets.chomp.to_i
    flight = airport.flights[flight_number]
    flight.add_passenger(passenger)
    puts "#{passenger.name} added to #{flight}"
    gets

  when '4' # List passengers of a flight
    puts "What flight do you want to list the passengers of?"
    list_flights(airport)

    flight_number = gets.chomp.to_i
    flight = airport.flights[flight_number]

    puts "The passenger list for this flight is:"
    list_passengers(flight)
    gets

  end

  response = menu
end
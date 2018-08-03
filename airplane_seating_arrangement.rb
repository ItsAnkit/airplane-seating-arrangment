require_relative 'seating_arrangement'

puts 'Enter seating structure for flight'
structure = gets.chomp
puts 'Enter no. of passengers waiting in queue'
passengers_count = gets.chomp
airplane = SeatingArrangement.new(structure , passengers_count)
airplane.print_arrangement



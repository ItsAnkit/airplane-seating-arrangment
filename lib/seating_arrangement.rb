require_relative 'aisle_arrangement.rb'
require_relative 'window_arrangement.rb'
require_relative 'central_arrangement.rb'
require_relative 'compartments.rb'
require 'json'
require 'pry'

class SeatingArrangement

  def initialize(structure, passengers_count)
    @structure = JSON.parse(structure)
    @passengers_count = passengers_count.to_i
  end

  def print_arrangement
    set_data
    message = fill_seats
    construct_arrangement
    print "\n Seating Arrangement from left to right \n"
    headings = arrangements
    @compartment_arrangement = @compartments.get_seat_arrangement
    @compartment_arrangement.zip(headings).each do |compartment, heading|
      print heading[0]
      print "\n"
      display_arrangement(compartment)
      print "\n"
    end
    puts message if message
  end

  private

  def set_data
    @compartments = Compartments.new(@structure)
    @compartment_structure = @compartments.get_structure
    @aisle = AisleArrangement.new(@compartment_structure)
    @central = CentralArrangement.new(@compartment_structure)
    @window = WindowArrangement.new(@compartment_structure)
  end

  def arrangements
    [['Window  Central  Aisle'],
     ['Aisle  Central  Central  Aisle'],
     ['Aisle  Aisle'],
     ['Aisle Central  Window']]
  end

  def display_arrangement(compartment)
    compartment.each do |row|
        row.each do |item|
          value = item.to_i < 10 ? " #{item}       " : "#{item}       "
          print value
        end
        print "\n"
    end
  end

  def fill_seats
    aisle_seats = @aisle.seat_structure.flatten.length
    window_seats = @window.seat_structure.flatten.length
    central_seats = @central.seat_structure.flatten.length
    if @passengers_count <= aisle_seats
      @aisle.set_seat_arrangement(0, @passengers_count)
    elsif @passengers_count <= (aisle_seats + window_seats)
      @aisle.set_seat_arrangement(0, aisle_seats)
      @window.set_seat_arrangement(aisle_seats, @passengers_count)
    else
      non_central_seats = aisle_seats + window_seats
      total_seats = non_central_seats + central_seats
      total_seats = (@passengers_count > total_seats) ? total_seats : @passengers_count
      @aisle.set_seat_arrangement(0, aisle_seats)
      @window.set_seat_arrangement(aisle_seats, non_central_seats)
      @central.set_seat_arrangement(non_central_seats, total_seats)
      "Airline can arrange for maximum #{total_seats} seats." if @passengers_count > total_seats
    end
  end

  def construct_arrangement
    aisle_arrangement = @aisle.get_seat_arrangement
    window_arrangement = @window.get_seat_arrangement
    central_arrangement = @central.get_seat_arrangement
    @compartments.set_seat_arrangement(aisle_arrangement, window_arrangement,central_arrangement)
  end
end

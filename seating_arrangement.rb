require_relative 'aisle_arrangement.rb'
require_relative 'window_arrangement.rb'
require_relative 'central_arrangement.rb'
require 'json'
require 'pry'

class SeatingArrangement
  def initialize(structure, passengers_count)
    @structure = JSON.parse(structure)
    @passengers_count = passengers_count.to_i
  end

  def print_arrangement
    fetch_compartments
    @aisle = AisleArrangement.new(aisle_structure)
    @central = CentralArrangement.new(central_structure)
    @window = WindowArrangement.new(window_structure)
    fill_seats
    construct_arrangement
    print "\n"
    print "Seating Arrangement from left to right"
    print "\n"
    headings = [['Window  Central  Aisle'],
                ['Aisle  Central  Central  Aisle'],
                ['Aisle  Aisle'],
                ['Aisle Central  Window']]
    @compartments.zip(headings).each do |compartment, heading|
      print heading[0]
      print "\n"
      display_arrangement(compartment)
      print "\n"
    end
    puts @message if @message
  end

  private
  def display_arrangement(compartment)
    compartment.each do |arr|
        arr.each do |item|
          value = item.to_i < 10 ? " #{item}       " : "#{item}       "
          print value
        end
        print "\n"
    end
  end

  def fill_seats
    aisle_seats = aisle_structure.flatten.length
    window_seats = window_structure.flatten.length
    central_seats = central_structure.flatten.length
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
      @message = "Airline can arrange for maximum #{@passengers_count} seats." if @passengers_count > total_seats
    end
  end

  def fetch_compartments
    @compartments = []
    @structure.each { |row| @compartments << Array.new(row[1]) { Array.new(row[0]) } }
  end

  def aisle_structure
    [Array.new(@compartments[0].length, ' '), Array.new(@compartments[1].length, ' '), Array.new(@compartments[1].length, ' '), Array.new(@compartments[2].length, ' '), Array.new(@compartments[2].length, ' '), Array.new(@compartments[3].length, ' ')]
  end

  def central_structure
    [Array.new(@compartments[0].length, ' '), Array.new(@compartments[1].length, ' '), Array.new(@compartments[1].length, ' '), Array.new(@compartments[3].length, ' ')]
  end

  def window_structure
    [Array.new(@compartments[0].length, ' '), Array.new(@compartments[3].length, ' ')]
  end

  def construct_arrangement
    aisle_arrangement = @aisle.get_seat_arrangement
    window_arrangement = @window.get_seat_arrangement
    central_arrangement = @central.get_seat_arrangement
    construct_first_compartment(aisle_arrangement, window_arrangement, central_arrangement)
    construct_second_compartment(aisle_arrangement, central_arrangement)
    construct_third_compartment(aisle_arrangement)
    construct_fourth_compartment(aisle_arrangement, window_arrangement, central_arrangement)
  end

  def construct_first_compartment(aisle_arrangement, window_arrangement, central_arrangement)
    index = 0
    while index < @compartments[0].length
      @compartments[0][index][0] = window_arrangement[0][index]
      @compartments[0][index][1] = central_arrangement[0][index]
      @compartments[0][index][2] = aisle_arrangement[0][index]
      index += 1
    end
  end

  def construct_second_compartment(aisle_arrangement, central_arrangement)
    index = 0
    while index < @compartments[1].length
      @compartments[1][index][0] = aisle_arrangement[1][index]
      @compartments[1][index][1] = central_arrangement[1][index]
      @compartments[1][index][2] = central_arrangement[2][index]
      @compartments[1][index][3] = aisle_arrangement[2][index]
      index += 1
    end
  end

  def construct_third_compartment(aisle_arrangement)
    index = 0
    while index < @compartments[2].length
      @compartments[2][index][0] = aisle_arrangement[3][index]
      @compartments[2][index][1] = aisle_arrangement[4][index]
      index += 1
    end
  end

  def construct_fourth_compartment(aisle_arrangement, window_arrangement, central_arrangement)
    index = 0
    while index < @compartments[3].length
      @compartments[3][index][0] = aisle_arrangement[5][index]
      @compartments[3][index][1] = central_arrangement[3][index]
      @compartments[3][index][2] = window_arrangement[1][index]
      index += 1
    end
  end
end

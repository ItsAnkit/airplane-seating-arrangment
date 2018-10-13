require_relative 'seats_filler'

class AisleArrangement
  include SeatsFiller

  def initialize(compartment_structure)
    @compartment_structure = compartment_structure
    @seats = seat_structure
  end

  def set_seat_arrangement(seats_filled, passengers_count)
    fill_seats(seats_filled, passengers_count, @seats)
  end

  def get_seat_arrangement
    @seats
  end

  def seat_structure
    [ Array.new(@compartment_structure[0].length, ' '),
      Array.new(@compartment_structure[1].length, ' '),
      Array.new(@compartment_structure[1].length, ' '),
      Array.new(@compartment_structure[2].length, ' '),
      Array.new(@compartment_structure[2].length, ' '),
      Array.new(@compartment_structure[3].length, ' ') ]
  end
end

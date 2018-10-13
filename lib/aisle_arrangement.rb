require_relative 'seats_filler'

class AisleArrangement
  include SeatsFiller

  def initialize(seats)
    @seats = seats
  end

  def set_seat_arrangement(seats_filled, passengers_count)
    fill_seats(seats_filled, passengers_count, @seats)
  end

  def get_seat_arrangement
    @seats
  end
end
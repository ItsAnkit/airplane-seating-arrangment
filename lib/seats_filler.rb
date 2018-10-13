module SeatsFiller
  def fill_seats(seats_filled, passengers_count, seats)
    @row = 0
    @column = 0
    while seats_filled < passengers_count do
      if @row >= seats.length
        @row = 0
        @column += 1
      end
      if seats[@row].length <= @column
        @row += 1
        next
      end
      seats_filled += 1
      seats[@row][@column] = seats_filled
      @row += 1
    end
  end
end

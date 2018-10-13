require 'pry'

class Compartments
  def initialize(structure)
    @structure = structure
    @compartments = []
  end

  def get_structure
    @structure.each { |row| @compartments << Array.new(row[1]) { Array.new(row[0]) } }
    @compartments
  end

  def get_seat_arrangement
    @compartments
  end

  def set_seat_arrangement(aisle_arrangement, window_arrangement,central_arrangement)
    construct_first_compartment(aisle_arrangement, window_arrangement, central_arrangement)
    construct_second_compartment(aisle_arrangement, central_arrangement)
    construct_third_compartment(aisle_arrangement)
    construct_fourth_compartment(aisle_arrangement, window_arrangement, central_arrangement)
  end

  private

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

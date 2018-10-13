require 'rspec'
require_relative '../lib/compartments'

describe Compartments, type: :class do

  context 'when provided with a seating structure' do
    before(:each) do
      structure = [[3, 2], [4, 3], [2, 3], [3, 4]]
      @compartments = Compartments.new(structure)
      @compartment_structure = @compartments.get_structure
    end

    it 'constructs an array with provided structure' do
      expect(@compartment_structure[0].length).to eq(2)
      expect(@compartment_structure[1].length).to eq(3)
      expect(@compartment_structure[2].length).to eq(3)
      expect(@compartment_structure[3].length).to eq(4)
    end

    it 'construct airplane seat arrangement using provided aisle, window and central arrangement' do
      aisle_arrangement =  [[1, 7], [2, 8, 13], [3, 9, 14], [4, 10, 15], [5, 11, 16], [6, 12, 17, 18]]
      window_arrangement = [[19, 21], [20, 22, 23, 24]]
      central_arrangement = [[25, 29], [26, 30, " "], [27, " ", " "], [28, " ", " ", " "]]
      @compartments.set_seat_arrangement(aisle_arrangement, window_arrangement,central_arrangement)
      seat_arrangement = @compartments.get_seat_arrangement
      expect(seat_arrangement[0]).to eq([[19, 25, 1], [21, 29, 7]])
      expect(seat_arrangement[1]).to eq([[2, 26, 27, 3], [8, 30, " ", 9], [13, " ", " ", 14]])
      expect(seat_arrangement[2]).to eq([[4, 5], [10, 11], [15, 16]])
    end
  end
end

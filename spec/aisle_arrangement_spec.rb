require 'rspec'
require_relative '../lib/aisle_arrangement'

describe AisleArrangement, type: :class do

  context 'when provided with queue size and arrangement pattern' do
    before(:each) do
      @seats_arrangement = [[["", "", ""], ["", "", ""]],
                            [["", "", "", ""], ["", "", "", ""],
                            ["", "", "", ""]],
                            [["", ""], ["", ""], ["", ""]],
                            [["", "", ""], ["", "", ""],
                            ["", "", ""], ["", "", ""]]]
    end

    it 'aisle seats are not alloted when there are no passengers' do
      aisle_arrangement = AisleArrangement.new(@seats_arrangement)
      aisle_arrangement.set_seat_arrangement(0, 0)
      seats = aisle_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(' ')
    end

    it 'aisle seats are alloted when there are are passengers' do
      aisle_arrangement = AisleArrangement.new(@seats_arrangement)
      aisle_arrangement.set_seat_arrangement(0, 10)
      seats = aisle_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(1)
      expect(seats[1][1]).eql?(5)
    end
  end
end

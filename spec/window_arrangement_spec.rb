require 'rspec'
require_relative '../window_arrangement'

describe WindowArrangement, type: :class do

  context 'when provided with queue size and arrangement pattern' do
    before(:each) do
      @seats_arrangement = [["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""]]
    end

    it 'window seats are not alloted when there are no passengers' do
      window_arrangement = WindowArrangement.new(@seats_arrangement)
      window_arrangement.set_seat_arrangement(0, 0)
      seats = window_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(' ')
    end

    it 'window seats are alloted when there are are passengers' do
      window_arrangement = WindowArrangement.new(@seats_arrangement)
      window_arrangement.set_seat_arrangement(0, 10)
      seats = window_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(1)
      expect(seats[1][1]).eql?(5)
    end
  end
end

require 'rspec'
require_relative '../central_arrangement'

describe CentralArrangement, type: :class do

  context 'when provided with queue size and arrangement pattern' do
    before(:each) do
      @seats_arrangement = [["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""]]
    end

    it 'central seats are not alloted when there are no passengers' do
      central_arrangement = CentralArrangement.new(@seats_arrangement)
      central_arrangement.set_seat_arrangement(0, 0)
      seats = central_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(' ')
    end

    it 'central seats are alloted when there are are passengers' do
      central_arrangement = CentralArrangement.new(@seats_arrangement)
      central_arrangement.set_seat_arrangement(0, 10)
      seats = central_arrangement.get_seat_arrangement
      expect(seats[0][0]).eql?(1)
      expect(seats[1][1]).eql?(5)
    end
  end
end

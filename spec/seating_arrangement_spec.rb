require 'rspec'
require_relative '../seating_arrangement'

describe SeatingArrangement, type: :class do

  context 'when provided with queue size and arrangement pattern' do
    before(:each) do
      @structure = "[ [3,2], [4,5], [2,3], [3,5] ]"
    end

    it 'will not fill window and central seats if queue size is less' do
      passengers_count = 10
      airplane = SeatingArrangement.new(@structure, passengers_count)
      airplane.print_arrangement
      expect(airplane.instance_variable_get(:@compartments)[0][0][0]).eql?(' ')
      expect(airplane.instance_variable_get(:@compartments)[0][0][1]).eql?(' ')
      expect(airplane.instance_variable_get(:@compartments)[0][0][2]).eql?(1)
    end

    it 'will not fill central seats if queue size is not sufficient' do
      passengers_count = 24
      airplane = SeatingArrangement.new(@structure, passengers_count)
      airplane.print_arrangement
      expect(airplane.instance_variable_get(:@compartments)[0][0][0]).eql?(24)
      expect(airplane.instance_variable_get(:@compartments)[0][0][1]).eql?(' ')
      expect(airplane.instance_variable_get(:@compartments)[0][0][2]).eql?(1)
    end

    it 'will fill all types of seats' do
      passengers_count = 40
      airplane = SeatingArrangement.new(@structure, passengers_count)
      airplane.print_arrangement
      expect(airplane.instance_variable_get(:@compartments)[0][0][0]).eql?(24)
      expect(airplane.instance_variable_get(:@compartments)[0][0][1]).eql?(31)
      expect(airplane.instance_variable_get(:@compartments)[0][0][2]).eql?(1)
    end

    it 'will print arrangement along with message' do
      passengers_count = 140
      airplane = SeatingArrangement.new(@structure, passengers_count)
      airplane.print_arrangement
      expect(airplane.instance_variable_get(:@message)).eql?('Airline can arrange for maximum #{passengers_count} seats.')
    end
  end
end

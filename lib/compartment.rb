class Compartment
  def initialize(structure)
    @structure = structure
  end

  def construct_compartment_structure
    @compartments = []
    @structure.each { |row| @compartments << Array.new(row[1]) { Array.new(row[0]) } }
  end

end

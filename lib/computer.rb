class Computer
  attr_reader :coords
  def initialize
    @coords = ['A1', 'A2', 'A3', 'A4',
               'B1', 'B2', 'B3', 'B4',
               'C1', 'C2', 'C3', 'C4',
               'D1', 'D2', 'D3', 'D4']
  end

  def ship_placement
    ship_coords = []
    @coords.each do |index|
      ship_coord << index.sample
    end
  end
end

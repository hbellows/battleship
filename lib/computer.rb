class Computer
  attr_reader :coords, :ship_coords_2unit
  def initialize
    @coords = ['A1', 'A2', 'A3', 'A4',
               'B1', 'B2', 'B3', 'B4',
               'C1', 'C2', 'C3', 'C4',
               'D1', 'D2', 'D3', 'D4']
    @second_coord = {'B2' => ['A2','B1','B4','C2']}
    @ship_coords_2unit = []
  end

  def ship_first_coord
    ship_coords_2unit << @coords.sample
  end

  def ship_second_coord
    require "pry"; binding.pry

  end



end

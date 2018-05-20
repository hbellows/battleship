class Computer
  attr_reader :board, :ship_2_unit, :ship_3_unit
  def initialize
    @board = ['A1', 'A2', 'A3', 'A4',
              'B1', 'B2', 'B3', 'B4',
              'C1', 'C2', 'C3', 'C4',
              'D1', 'D2', 'D3', 'D4']

    @ship_2_unit = []

    @ship_3_unit = []

    @second_coord = {'A1'=>['B1', 'A2'], 'A2'=>['A1', 'B2', 'A3'],
                     'A3'=>['A2', 'B3', 'A4'], 'A4'=>['A3', 'B4'],
                     'B1'=>['A1', 'C1', 'B2'], 'B2'=>['A2', 'B1', 'C2', 'B3'],
                     'B3'=>['A3', 'B2', 'C3', 'B4'], 'B4'=>['A4', 'B3', 'C4'],
                     'C1'=>['B1', 'D1', 'C2'], 'C2'=>['B2', 'C1', 'D2', 'C3'],
                     'C3'=>['B3', 'C2', 'D3', 'C4'], 'C4'=>['B4', 'C3', 'D4'],
                     'D1'=>['C1', 'D2'], 'D2'=>['C2', 'D1', 'D3'],
                     'D3'=>['C3', 'D2', 'D4'], 'D4'=>['C4', 'D3']}
  end

  def first_coord_2_unit
    coord_1 = @board.sample
    @ship_2_unit << coord_1
  end

  def second_coord_2_unit
    coord = @ship_2_unit[0]
    coord_2 = @second_coord[coord].sample
    @ship_2_unit << coord_2
  end

  def first_coord_3_unit
    coord_1 = @board.sample
    if @ship_2_unit.include?(coord_1)
      first_coord_3_unit
    else
      @ship_3_unit << coord_1
    end
  end

  def second_coord_3_unit
    coord = @ship_3_unit[0]
    coord_2 = @second_coord[coord].sample
    if @ship_2_unit.include?(coord_2)
      second_coord_3_unit
    else
      @ship_3_unit << coord_2
    end
  end

  def third_coord_3_unit
    coord = @ship_3_unit[1]
    coord_3 = @second_coord[coord].sample

  end

end

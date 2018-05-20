class Player
  attr_reader :board, :input, :ship_2_unit, :ship_3_unit

  def initialize
    @board = ['A1', 'A2', 'A3', 'A4',
              'B1', 'B2', 'B3', 'B4',
              'C1', 'C2', 'C3', 'C4',
              'D1', 'D2', 'D3', 'D4']

    @input = input

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

    @third_coord = {
              ['A1', 'A2']=>['A3'], ['A2', 'A3']=>['A4'], ['A3', 'A4']=>['A2'],
              ['B1', 'B2']=>['B3'], ['B2', 'B3']=>['B4'], ['B3', 'B4']=>['B2'],
              ['C1', 'C2']=>['C3'], ['C2', 'C3']=>['C4'], ['C3', 'C4']=>['C2'],
              ['D1', 'D2']=>['D3'], ['D2', 'D3']=>['D4'], ['D3', 'D4']=>['D2'],
              ['A1', 'B1']=>['C1'], ['B1', 'C1']=>['D1'], ['C1', 'D1']=>['B1'],
              ['A2', 'B2']=>['C2'], ['B2', 'C2']=>['D2'], ['C2', 'D2']=>['B2'],
              ['A3', 'B3']=>['C3'], ['B3', 'C3']=>['D3'], ['C3', 'D3']=>['B3'],
              ['A4', 'B4']=>['C4'], ['B4', 'C4']=>['D4'], ['C4', 'D4']=>['B4']
              }
  end

  def validate_1st_input(input)
    input = input.upcase
    if @board.include?(input)
      return true
    else
      return false
    end
  end

  def first_coord_2_unit(input)
    coord_1 = input
    @ship_2_unit << coord_1 if validate_1st_input(input)
  end

  def validate_2nd_input(input)
    new_input = input.upcase
    coord_1 = @ship_2_unit[0]
    if @second_coord[coord_1].include?(new_input)
      return true
    else
      return false
    end
  end

  def second_coord_2_unit(input)
    coord_2 = input
    @ship_2_unit << coord_2 if validate_2nd_input(input)
  end

  def validate_3rd_input(input)
    # needs to validate input is on the board (validate_1st_input),
    # AND is NOT in the @ship_2_unit array
    input = input.upcase
    if input.validate_1st_input
    end
  end

  def first_coord_3_unit(input)
    coord_1 = input.upcase
    if @ship_2_unit.include?(coord_1)
      first_coord_3_unit
    else
      @ship_3_unit << coord_1
    end
  end

  def validate_4th_input
    # needs to validate the input is on the board (validate_1st_input),
    # AND is NOT in the @ship_2_unit array (validate_3rd_input),
    # AND is in the second_coord hash/array
  end

  def second_coord_3_unit(input)
    coord = @ship_3_unit[0]
    coord_2 = input
    if @ship_2_unit.include?(coord_2)
      second_coord_3_unit
    else
      @ship_3_unit << coord_2
    end
  end

  def validate_5th_input
    # needs to validate the input is on the board (validate_1st_input)
    # AND is NOT in the @ship_2_unit array (validate_3rd_input)
    # AND is in the @third_coord hash/array
  end

  def third_coord_3_unit
    coord = @ship_3_unit.sort
    coord_3 = @third_coord[coord].sample
    if @ship_2_unit.include?(coord_3)
      third_coord_3_unit
    else
      @ship_3_unit << coord_3
    end
  end
end

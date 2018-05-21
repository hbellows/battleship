class Player
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

  def first_coord_2_unit(input)
    coord_1 = input.upcase
    @ship_2_unit << coord_1 if coord_1_valid?(coord_1)
  end

  def second_coord_2_unit(input)
    coord_2 = input.upcase
    @ship_2_unit << coord_2 if coord_2_valid?(coord_2)
  end

  def first_coord_3_unit(input)
    coord_3 = input.upcase
    if coord_3_valid?(coord_3)
      @ship_3_unit << coord_3
    else
      first_coord_3_unit
    end
  end

  def second_coord_3_unit(input)
    # require "pry"; binding.pry
    coord_4 = input.upcase
    if coord_4_valid?(coord_4)
      @ship_3_unit << coord_4
    # else
    #   second_coord_3_unit
    end
  end

  def third_coord_3_unit(input)
    # coord_4 = @ship_3_unit.sort
    coord_5 = input.upcase
    if coord_5_valid?(coord_5)
      @ship_3_unit << coord_5
    # else
    #   third_coord_3_unit
    end
  end


  def coord_1_valid?(input)
    input = input.upcase
    if @board.include?(input)
      return true
    else
      return false
    end
  end

  def coord_2_valid?(input)
    input = input.upcase
    coord_1 = @ship_2_unit[0]
    if @board.include?(input) && @second_coord[coord_1].include?(input)
      return true
    else
      return false
    end
  end

  def coord_3_valid?(input)
    input = input.upcase
    if @board.include?(input) && !@ship_2_unit.include?(input)
      return true
    else
      return false
    end
  end

  def coord_4_valid?(input)
    coord_3 = @ship_3_unit[0]
    input = input.upcase
    if @board.include?(input) && !@ship_2_unit.include?(input) &&
      @second_coord[coord_3].include?(input)
      return true
    else
      return false
    end
  end

  def coord_5_valid?(input)
    input = input.upcase
    coord_4 = @ship_3_unit
    if @board.include?(input) && !@ship_2_unit.include?(input) &&
      @third_coord[coord_4].include?(input)
      return true
    else
      false
    end
  end

end

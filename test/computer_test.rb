require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_can_find_coordinates
    comp = Computer.new

    assert_equal 'A1', comp.board[0]
    assert_equal 'B2', comp.board[5]
    assert_equal 'C3', comp.board[10]
    assert_equal 'D4', comp.board[15]
  end

  def test_it_can_choose_1st_ship_coord_2_unit_ship
    comp = Computer.new

    comp.first_coord_2_unit
    assert_includes comp.board, comp.ship_2_unit[0]
  end

  def test_it_can_choose_2nd_ship_coord_2_unit_ship
    comp = Computer.new

    comp.first_coord_2_unit
    comp.second_coord_2_unit
    assert_includes comp.board, comp.ship_2_unit[1]
  end

  def test_it_can_choose_1st_ship_coord_3_unit_ship
    comp = Computer.new

    comp.first_coord_3_unit
    assert_includes comp.board, comp.ship_3_unit[0]
  end

  def test_it_can_choose_2nd_ship_coord_3_unit_ship
    comp = Computer.new

    comp.first_coord_3_unit
    comp.second_coord_3_unit
    assert_includes comp.board, comp.ship_3_unit[1]
  end

  def test_it_can_choose_3rd_ship_coord_3_unit_ship
    comp = Computer.new

    comp.first_coord_3_unit
    comp.second_coord_3_unit
    comp.third_coord_3_unit
    assert_includes comp.board, comp.ship_3_unit[2]
  end
end

require './test/test_helper'
require '.lib/player'

class PlayerTest < Minitest::Test

  def test_it_can_find_coordinates
    player = Player.new

    assert_equal 'A1', player.board[0]
    assert_equal 'B2', player.board[5]
    assert_equal 'C3', player.board[10]
    assert_equal 'D4', player.board[15]
  end

  def test_it_can_choose_1st_ship_coord_2_unit_ship
    player = Player.new

    player.first_coord_2_unit
    assert_includes player.board, player.ship_2_unit[0]
  end

  def test_it_can_choose_2nd_ship_coord_2_unit_ship
    player = Player.new

    player.first_coord_2_unit
    player.second_coord_2_unit
    assert_includes player.board, player.ship_2_unit[1]
  end

  def test_it_can_choose_1st_ship_coord_3_unit_ship
    player = Player.new

    player.first_coord_3_unit
    assert_includes player.board, player.ship_3_unit[0]
  end

  def test_it_can_choose_2nd_ship_coord_3_unit_ship
    player = Player.new

    player.first_coord_3_unit
    player.second_coord_3_unit
    assert_includes player.board, player.ship_3_unit[1]
  end

  def test_it_can_choose_3rd_ship_coord_3_unit_ship
    player = Player.new

    player.first_coord_3_unit
    player.second_coord_3_unit
    player.third_coord_3_unit
    assert_includes player.board, player.ship_3_unit[2]
  end
end

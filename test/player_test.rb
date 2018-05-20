require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_can_find_coordinates
    # skip
    player = Player.new

    assert_equal 'A1', player.board[0]
    assert_equal 'B2', player.board[5]
    assert_equal 'C3', player.board[10]
    assert_equal 'D4', player.board[15]
  end

  def test_it_can_validate_user_1st_ship_input
    # skip
    player = Player.new

    assert player.validate_1st_input('A3')
    refute player.validate_1st_input('z23')
  end

  def test_it_can_add_1st_ship_coord_2_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('A1')
    assert_equal 'A1', player.ship_2_unit[0]
  end

  def test_it_can_validate_user_2nd_ship_input
    # skip
    player = Player.new

    player.first_coord_2_unit('A1')
    assert player.validate_2nd_input('a2')
    refute player.validate_2nd_input('A4')
  end

  def test_it_can_add_2nd_ship_coord_2_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('B2')
    player.second_coord_2_unit('C2')
    assert_equal 'B2', player.ship_2_unit[0]
    assert_equal 'C2', player.ship_2_unit[1]
  end

  def test_it_can_validate_user_3rd_ship_input

  end

  def test_it_can_add_1st_ship_coord_3_unit_ship
    skip
    player = Player.new

    player.first_coord_3_unit('D4')
    assert_equal 'D4', player.ship_3_unit[0]
  end

  def test_it_can_validate_user_4th_ship_input

  end

  def test_it_can_add_2nd_ship_coord_3_unit_ship
    skip
    player = Player.new

    player.first_coord_3_unit('A2')
    player.second_coord_3_unit('A1')
    assert_equal 'A4', player.ship_3_unit[0]
    assert_equal 'A1', player.ship_3_unit[1]
  end

  def test_it_can_validate_user_5th_ship_input

  end

  def test_it_can_add_3rd_ship_coord_3_unit_ship
    skip
    player = Player.new

    player.first_coord_3_unit
    player.second_coord_3_unit
    player.third_coord_3_unit
    assert_includes player.board, player.ship_3_unit[2]
  end

  # def test_it_can_choose_a_shot_coord
  #   skip
  #   player = Player.new
  #
  # end
end

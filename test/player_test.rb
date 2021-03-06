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

    assert player.coord_1_valid?('A3')
    refute player.coord_1_valid?('z23')
  end

  def test_it_can_add_1st_ship_coord_2_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('A1')
    assert_equal 'A1', player.ship_2_unit[0]

    player.first_coord_2_unit('f3')
    refute_equal 'F3', player.ship_2_unit[0]
  end

  def test_it_can_validate_user_2nd_ship_input
    # skip
    player = Player.new

    player.first_coord_2_unit('a1')
    # player.second_coord_2_unit('a2')
    assert player.coord_2_valid?('a2')
    refute player.coord_2_valid?('A4')
  end

  def test_it_can_add_2nd_ship_coord_2_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('B2')
    player.second_coord_2_unit('C2')
    assert_equal 'B2', player.ship_2_unit[0]
    assert_equal 'C2', player.ship_2_unit[1]
  end

  def test_it_can_detect_invalid_user_input
    # skip
    player = Player.new

    player.first_coord_2_unit('B2')
    player.second_coord_2_unit('F2')
    assert_equal 'B2', player.ship_2_unit[0]
    refute_equal 'F2', player.ship_2_unit[1]
  end

  def test_it_can_validate_user_3rd_ship_input
    # skip
    player = Player.new

    player.first_coord_2_unit('A4')
    player.second_coord_2_unit('B4')

    assert player.coord_3_valid?('B1')
    refute player.coord_3_valid?('B4')
  end

  def test_it_can_add_1st_ship_coord_3_unit_ship
    # skip
    player = Player.new

    player.first_coord_3_unit('D4')
    assert_equal 'D4', player.ship_3_unit[0]
  end

  def test_it_can_validate_user_4th_ship_input
    # skip
    player = Player.new

    player.first_coord_2_unit('A4')
    player.second_coord_2_unit('B4')

    assert player.coord_3_valid?('B1')
    refute player.coord_3_valid?('B4')
  end

  def test_it_can_add_2nd_ship_coord_3_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('A4')
    player.second_coord_2_unit('B4')
    player.first_coord_3_unit('A2')
    player.second_coord_3_unit('A1')
    assert_equal 'A2', player.ship_3_unit[0]
    assert_equal 'A1', player.ship_3_unit[1]
  end

  def test_it_can_validate_user_5th_ship_input
    # skip
    player = Player.new

    player.first_coord_2_unit('A4')
    player.second_coord_2_unit('B4')
    player.first_coord_3_unit('D2')
    player.second_coord_3_unit('D3')

    assert player.coord_5_valid?('D4')
    refute player.coord_5_valid?('D1')
  end

  def test_it_can_add_3rd_ship_coord_3_unit_ship
    # skip
    player = Player.new

    player.first_coord_2_unit('A4')
    player.second_coord_2_unit('B4')
    player.first_coord_3_unit('A1')
    player.second_coord_3_unit('B1')
    player.third_coord_3_unit('C1')
    assert_equal 'C1', player.ship_3_unit[2]
  end
end

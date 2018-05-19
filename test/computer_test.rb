require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_can_find_coordinates
    computer = Computer.new

    assert_equal 'A1', computer.coords[0]
    assert_equal 'B2', computer.coords[5]
    assert_equal 'C3', computer.coords[10]
    assert_equal 'D4', computer.coords[15]
  end

  def test_it_can_choose_a_random_coordinate
    computer = Computer.new
    ship_coords = computer.ship_placement

    assert_includes ship_coords, computer.coords
  end
end

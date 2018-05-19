require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_can_find_coordinates
    computer = Computer.new

    assert_equal 'A1', computer.coords[0]

  end
end

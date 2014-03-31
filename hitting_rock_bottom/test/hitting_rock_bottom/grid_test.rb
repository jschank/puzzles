require 'minitest_helper'

class GridTest < MiniTest::Test
  def test_it_can_create_an_empty_two_dimensional_grid
    g = Grid.new()
    assert(g.empty?)
    assert_equal([], g.rows)
    assert_equal([], g.columns)
    assert_equal(0, g.cells)
  end
end

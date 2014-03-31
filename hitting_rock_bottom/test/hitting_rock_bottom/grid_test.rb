require 'minitest_helper'

class GridTest < MiniTest::Test
  def test_it_can_create_an_empty_two_dimensional_grid
    g = Grid.new()
    assert(g.empty?, 'New Grid is empty')
    assert_equal([], g.rows, 'New Grid has no rows')
    assert_equal([], g.columns, 'New Grid has no columns')
    assert_equal(0, g.cells, 'New Grid has no cells')
  end

  def test_it_can_create_empty_2_by_3_grid
    g = Grid.new(2, 3)
    refute(g.empty?, 'inital grid is not empty')
    assert_equal([[nil, nil, nil], [nil, nil, nil]], g.rows, 'Initial grid has rows filled with nil')
    assert_equal([[nil, nil], [nil, nil], [nil, nil]], g.columns, 'Initial grid has columns filled will nil')
    assert_equal(6, g.cells, 'Inital grid has correct number of cells')
  end

end

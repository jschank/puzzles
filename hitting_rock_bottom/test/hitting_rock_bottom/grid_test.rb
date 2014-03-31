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

  def test_it_can_get_and_set_cell_values
    g = Grid.new(1, 1)
    g[0,0] = 'x'
    assert_equal('x', g[0,0], 'Grid allows user to retrieve value of a cell')
    assert_raises(IndexError) {g[2,0]}
    assert_raises(IndexError) {g[0,2]}
  end

  def test_it_can_display_itself_as_string
    g = Grid.new(4, 5)
    g[0,0] = 'a'
    g[0,1] = 'b'
    g[0,2] = 'c'
    g[0,3] = 'd'
    g[0,4] = 'e'
    g[1,0] = 'f'
    g[1,1] = 'g'
    g[1,2] = 'h'
    g[1,3] = 'i'
    g[1,4] = 'j'
    g[2,0] = 'k'
    g[2,1] = 'l'
    g[2,2] = 'm'
    g[2,3] = 'n'
    g[2,4] = 'o'
    g[3,0] = 'p'
    g[3,1] = 'q'
    g[3,2] = 'r'
    g[3,3] = 's'
    g[3,4] = 't'
    assert_equal("abcde\nfghij\nklmno\npqrst", g.to_s, 'Grid can display itself as a string')
  end

end

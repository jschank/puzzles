require_relative '../minitest_helper'

# test chessboard functionality
class GraphTest < MiniTest::Test
  def setup
  end

  def test_graph
    g = Graph.new
    g.add_vertex('A', {'B' => 7, 'C' => 8})
    g.add_vertex('B', {'A' => 7, 'F' => 2})
    g.add_vertex('C', {'A' => 8, 'F' => 6, 'G' => 4})
    g.add_vertex('D', {'F' => 8})
    g.add_vertex('E', {'H' => 1})
    g.add_vertex('F', {'B' => 2, 'C' => 6, 'D' => 8, 'G' => 9, 'H' => 3})
    g.add_vertex('G', {'C' => 4, 'F' => 9})
    g.add_vertex('H', {'E' => 1, 'F' => 3})
    assert_equal(%w(A B F H), g.shortest_path('A', 'H'), 'Shortest path from A to H')
  end

  def test_graph_2
    g = Graph.new
    g.add_vertex('A', {'B' => 1, 'C' => 1})
    g.add_vertex('B', {'A' => 1, 'F' => 1})
    g.add_vertex('C', {'A' => 1, 'F' => 1, 'G' => 1})
    g.add_vertex('D', {'F' => 1})
    g.add_vertex('E', {'H' => 1})
    g.add_vertex('F', {'B' => 1, 'C' => 1, 'D' => 1, 'G' => 1, 'H' => 1})
    g.add_vertex('G', {'C' => 1, 'F' => 1})
    g.add_vertex('H', {'E' => 1, 'F' => 1})
    assert_equal(%w(G F H E), g.shortest_path('G', 'E'), 'Shortest path from G to E')
    assert_equal(%w(C F H), g.shortest_path('C', 'H'), 'Shortest path from C to H')
  end

end

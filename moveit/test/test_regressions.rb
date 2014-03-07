require_relative 'minitest_helper'

# test chessboard functionality
class TestRegressions < MiniTest::Test
  def setup
    filepath = Pathname.new("resources").join('complex_board.txt')
    @board = ChessBoard.new
    @board.load(filepath)
  end

  def test_complex_board_c3_a2_should_be_legal
    # Bishop move - no I am correct on this one.
    refute(@board.valid_move?('c3', 'a2'), "Complex Board c3 to a2 should be legal")
  end

  def test_complex_board_c5_c4_should_be_legal
    # Pawn move
    assert(@board.valid_move?('c5', 'c4'), "Complex Board c5 to c4 should be legal")
  end

  def test_complex_board_e6_g4_should_be_legal
    # Bishop move
    assert(@board.valid_move?('e6', 'g4'), "Complex Board e6 to g4 should be legal")
  end

end

require 'minitest_helper'

# test chessboard functionality
class TestRook < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Rook.new(:black)
    assert_equal('bR', piece.to_s)

    piece = Rook.new(:white)
    assert_equal('wR', piece.to_s)
  end

  def test_movement
    board = Chessboard.new
    piece = Rook.new(:white)
    board.add(piece, 'd4')

    assert(piece.valid_move?('d4', 'g4', board), 'Rook can move on rank')
    assert(piece.valid_move?('d4', 'a4', board), 'Rook can move on rank')
    assert(piece.valid_move?('d4', 'd1', board), 'Rook can move on file')
    assert(piece.valid_move?('d4', 'd5', board), 'Rook can move on file')

    refute(piece.valid_move?('d4', 'b3', board), 'Rook can not move anywhere other than rank or file')
    refute(piece.valid_move?('d4', 'a3', board), 'Rook can not move anywhere other than rank or file')
  end

  def test_blockers
    board = Chessboard.new
    piece = Rook.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:white), 'd2')

    refute(piece.valid_move?('d4', 'h4', board), 'Rook blocked by friendly piece')
    refute(piece.valid_move?('d4', 'd1', board), 'Rook blocked by opponent')
  end

  def test_capture
    board = Chessboard.new
    piece = Rook.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:white), 'b4')
    board.add(Pawn.new(:white), 'd7')

    assert(piece.valid_move?('d4', 'b4', board), 'Rook can capture opponent')
    assert(piece.valid_move?('d4', 'd7', board), 'Rook can capture opponent')
    refute(piece.valid_move?('d4', 'e4', board), 'Rook cannot capture friendly piece')
  end

  def test_exposed_check
    board = Chessboard.new
    piece = Rook.new(:white)
    board.add(piece, 'd4')

    board.add(King.new(:white), 'd2')
    board.add(Rook.new(:black), 'd8')

    refute(piece.valid_move?('d4', 'b4', board), 'Rook cannot move to expose king to check')
    assert(piece.valid_move?('d4', 'd8', board), 'Rook can capture threatening piece')
  end
end

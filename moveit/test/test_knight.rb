require 'minitest_helper'

# test chessboard functionality
class TestKnight < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bN')
    assert_equal('bN', piece.show)

    piece = Chesspiece.create('wN')
    assert_equal('wN', piece.show)
  end

  def test_movement
    board = Chessboard.new
    piece = Knight.new(:white)
    board.add(piece, 'd4')

    assert(piece.valid_move?('d4', 'e6', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'f5', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'f3', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'e2', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'c2', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'b3', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'b5', board), 'Knight can move in an L shape')
    assert(piece.valid_move?('d4', 'c6', board), 'Knight can move in an L shape')

    refute(piece.valid_move?('d4', 'e3', board), 'Knight can not move diagonally')
    refute(piece.valid_move?('d4', 'b4', board), 'Knight can not move on a rank')
    refute(piece.valid_move?('d4', 'd6', board), 'Knight can not move on a file')
  end

  def test_blockers
    board = Chessboard.new
    piece = Knight.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'b5')
    board.add(Pawn.new(:black), 'd5')
    board.add(Pawn.new(:white), 'd2')

    assert(piece.valid_move?('d4', 'c2', board), 'Knight not blocked by opponent piece')
    assert(piece.valid_move?('d4', 'e6', board), 'Knight not blocked by friendly piece')
  end

  def test_capture_opponent
    board = Chessboard.new
    piece = Knight.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'e6')
    board.add(Pawn.new(:white), 'f5')
    board.add(Pawn.new(:white), 'f3')
    board.add(Pawn.new(:white), 'e2')
    board.add(Pawn.new(:white), 'c2')
    board.add(Pawn.new(:white), 'b3')
    board.add(Pawn.new(:white), 'b5')
    board.add(Pawn.new(:white), 'c6')

    assert(piece.valid_move?('d4', 'e6', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'f5', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'f3', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'e2', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'c2', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'b3', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'b5', board), 'Knight can capture opponents')
    assert(piece.valid_move?('d4', 'c6', board), 'Knight can capture opponents')
  end


  def test_capture_friendly
    board = Chessboard.new
    piece = Knight.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e6')
    board.add(Pawn.new(:black), 'f5')
    board.add(Pawn.new(:black), 'f3')
    board.add(Pawn.new(:black), 'e2')
    board.add(Pawn.new(:black), 'c2')
    board.add(Pawn.new(:black), 'b3')
    board.add(Pawn.new(:black), 'b5')
    board.add(Pawn.new(:black), 'c6')

    refute(piece.valid_move?('d4', 'e6', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'f5', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'f3', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'e2', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'c2', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'b3', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'b5', board), 'Knight can not capture friendly pieces')
    refute(piece.valid_move?('d4', 'c6', board), 'Knight can not capture friendly pieces')
  end

  # note: king movement cannot EXPOSE check.
  # but kings cannot move INTO check.
  def test_exposed_check
    board = Chessboard.new
    piece = Knight.new(:white)
    board.add(piece, 'd4')

    board.add(King.new(:white), 'd1')
    board.add(Rook.new(:black), 'd8')

    refute(piece.valid_move?('d4', 'e6', board), 'Knight cannot expose king to check')
  end

  def test_exposed_check
    board = Chessboard.new
    piece = Knight.new(:white)
    board.add(piece, 'g4')

    board.add(King.new(:white), 'd1')
    board.add(Knight.new(:black), 'e3')

    assert(piece.valid_move?('g4', 'e3', board), 'King can capture threatening piece')
  end
end

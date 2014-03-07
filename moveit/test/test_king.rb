require_relative 'minitest_helper'

# test chessboard functionality
class TestKing < MiniTest::Test
  def test_that_it_can_display_itself
    piece = ChessPiece.create('bK')
    assert_equal('bK', piece.to_s)

    piece = ChessPiece.create('wK')
    assert_equal('wK', piece.to_s)
  end

  def test_movement
    board = ChessBoard.new
    piece = King.new(:white)
    board.add(piece, 'd4')

    assert(piece.valid_move?('d4', 'e4', board), 'King can move one space on rank')
    assert(piece.valid_move?('d4', 'c4', board), 'King can move one space on rank')
    assert(piece.valid_move?('d4', 'd3', board), 'King can move one space on file')
    assert(piece.valid_move?('d4', 'd5', board), 'King can move one space on file')

    assert(piece.valid_move?('d4', 'e5', board), 'King can move one space on diagonal')
    assert(piece.valid_move?('d4', 'c5', board), 'King can move one space on diagonal')
    assert(piece.valid_move?('d4', 'c3', board), 'King can move one space on diagonal')
    assert(piece.valid_move?('d4', 'e3', board), 'King can move one space on diagonal')

    refute(piece.valid_move?('d4', 'b3', board), 'King can not move like a knight')
    refute(piece.valid_move?('d4', 'a3', board), 'King can not move anywhere other than rank or file or diagonal')
    refute(piece.valid_move?('d4', 'd6', board), 'King can not move more than one space')
  end

  def test_blockers
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:black), 'e5')

    refute(piece.valid_move?('d4', 'e4', board), 'King blocked by friendly piece')
    refute(piece.valid_move?('d4', 'e5', board), 'King blocked by friendly piece')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'e4')

    assert(piece.valid_move?('d4', 'e4', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'c4')

    assert(piece.valid_move?('d4', 'c4', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'd5')

    assert(piece.valid_move?('d4', 'd5', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'd3')

    assert(piece.valid_move?('d4', 'd3', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'e5')

    assert(piece.valid_move?('d4', 'e5', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'c5')

    assert(piece.valid_move?('d4', 'c5', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'e3')

    assert(piece.valid_move?('d4', 'e3', board), 'King can capture opponent')
  end

  def test_capture_opponent
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:white), 'c3')

    assert(piece.valid_move?('d4', 'c3', board), 'King can capture opponent')
  end

  def test_capture_friendly
    board = ChessBoard.new
    piece = King.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:black), 'c4')
    board.add(Pawn.new(:black), 'd5')
    board.add(Pawn.new(:black), 'd3')
    board.add(Pawn.new(:black), 'e5')
    board.add(Pawn.new(:black), 'c5')
    board.add(Pawn.new(:black), 'e3')
    board.add(Pawn.new(:black), 'c3')

    refute(piece.valid_move?('d4', 'e4', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'c4', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'd5', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'd3', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'e5', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'c5', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'e3', board), 'King can not capture friendly piece')
    refute(piece.valid_move?('d4', 'c3', board), 'King can not capture friendly piece')
  end

  # note: king movement cannot EXPOSE check.
  # but kings cannot move INTO check.
  def test_exposed_check
    board = ChessBoard.new
    piece = King.new(:white)
    board.add(piece, 'd4')

    board.add(Queen.new(:black), 'b3')
    board.add(Rook.new(:black), 'e4')

    refute(piece.valid_move?('d4', 'd5', board), 'King cannot move into check')
    assert(piece.valid_move?('d4', 'e4', board), 'King can capture threatening piece')
  end
end

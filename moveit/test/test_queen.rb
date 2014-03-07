require_relative 'minitest_helper'

# test chessboard functionality
class TestQueen < MiniTest::Test
  def test_that_it_can_display_itself
    piece = ChessPiece.create('bQ')
    assert_equal('bQ', piece.to_s)

    piece = ChessPiece.create('wQ')
    assert_equal('wQ', piece.to_s)
  end
  def test_movement
    board = ChessBoard.new
    piece = Queen.new(:white)
    board.add(piece, 'd4')

    assert(piece.valid_move?('d4', 'g4', board), 'Queen can move on rank')
    assert(piece.valid_move?('d4', 'a4', board), 'Queen can move on rank')
    assert(piece.valid_move?('d4', 'd1', board), 'Queen can move on file')
    assert(piece.valid_move?('d4', 'd5', board), 'Queen can move on file')

    assert(piece.valid_move?('d4', 'f6', board), 'Queen can move on diagonal')
    assert(piece.valid_move?('d4', 'c5', board), 'Queen can move on diagonal')
    assert(piece.valid_move?('d4', 'g1', board), 'Queen can move on diagonal')
    assert(piece.valid_move?('d4', 'b2', board), 'Queen can move on diagonal')

    refute(piece.valid_move?('d4', 'b3', board), 'Queen can not move like a knight')
    refute(piece.valid_move?('d4', 'a3', board), 'Queen can not move anywhere other than rank or file or diagonal')
  end

  def test_blockers
    board = ChessBoard.new
    piece = Queen.new(:black)
    board.add(piece, 'd4')

    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:white), 'd2')
    board.add(Pawn.new(:black), 'e5')
    board.add(Pawn.new(:white), 'b2')

    refute(piece.valid_move?('d4', 'h4', board), 'Queen blocked by friendly piece')
    refute(piece.valid_move?('d4', 'd1', board), 'Queen blocked by opponent')
    refute(piece.valid_move?('d4', 'f6', board), 'Queen blocked by friendly piece')
    refute(piece.valid_move?('d4', 'a1', board), 'Queen blocked by opponent')
  end

  def test_capture
    board = ChessBoard.new
    piece = Queen.new(:black)
    board.add(piece, 'd4')

    # rook style captures
    board.add(Pawn.new(:black), 'e4')
    board.add(Pawn.new(:white), 'b4')
    board.add(Pawn.new(:white), 'd7')

    # bishop style captures
    board.add(Pawn.new(:black), 'e5')
    board.add(Pawn.new(:white), 'b2')
    board.add(Pawn.new(:white), 'a7')

    assert(piece.valid_move?('d4', 'b4', board), 'Queen can capture opponent')
    assert(piece.valid_move?('d4', 'd7', board), 'Queen can capture opponent')
    assert(piece.valid_move?('d4', 'b2', board), 'Queen can capture opponent')
    assert(piece.valid_move?('d4', 'a7', board), 'Queen can capture opponent')

    refute(piece.valid_move?('d4', 'e4', board), 'Queen cannot capture friendly piece')
    refute(piece.valid_move?('d4', 'e5', board), 'Queen cannot capture friendly piece')
  end

  def test_exposed_check_rook_style
    board = ChessBoard.new
    piece = Queen.new(:white)
    board.add(piece, 'd4')

    board.add(King.new(:white), 'd2')
    board.add(Queen.new(:black), 'd8')

    refute(piece.valid_move?('d4', 'b4', board), 'Queen cannot move to expose king to check')
    assert(piece.valid_move?('d4', 'd8', board), 'Queen can capture threatening piece')
  end

  def test_exposed_check_bishop_style
    board = ChessBoard.new
    piece = Queen.new(:white)
    board.add(piece, 'd4')

    board.add(King.new(:white), 'b2')
    board.add(Queen.new(:black), 'f6')

    refute(piece.valid_move?('d4', 'b6', board), 'Queen cannot move to expose king to check')
    assert(piece.valid_move?('d4', 'f6', board), 'Queen can capture threatening piece')
  end
end

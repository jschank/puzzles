require_relative 'minitest_helper'

# test chessboard functionality
class TestBishop < MiniTest::Test
  def test_that_it_can_display_itself
    piece = ChessPiece.create('bB')
    assert_equal('bB', piece.to_s)

    piece = ChessPiece.create('wB')
    assert_equal('wB', piece.to_s)
  end

  def test_movement
    board = ChessBoard.new
    piece = ChessPiece.create('wB')
    board.add(piece, 'd4')

    assert(piece.valid_move?('d4', 'f6', board), 'Bishop can move on diagonal')
    assert(piece.valid_move?('d4', 'c5', board), 'Bishop can move on diagonal')
    assert(piece.valid_move?('d4', 'g1', board), 'Bishop can move on diagonal')
    assert(piece.valid_move?('d4', 'b2', board), 'Bishop can move on diagonal')

    refute(piece.valid_move?('d4', 'b3', board), 'Bishop can not move anywhere other than diagonal')
    refute(piece.valid_move?('d4', 'a3', board), 'Bishop can not move anywhere other than diagonal')
  end

  def test_blockers
    board = ChessBoard.new
    piece = ChessPiece.create('bB')
    board.add(piece, 'd4')

    board.add(ChessPiece.create('bP'), 'e5')
    board.add(ChessPiece.create('wP'), 'b2')

    refute(piece.valid_move?('d4', 'f6', board), 'Bishop blocked by friendly piece')
    refute(piece.valid_move?('d4', 'a1', board), 'Bishop blocked by opponent')
  end

  def test_capture
    board = ChessBoard.new
    piece = ChessPiece.create('bB')
    board.add(piece, 'd4')

    board.add(ChessPiece.create('bP'), 'e5')
    board.add(ChessPiece.create('wP'), 'b2')
    board.add(ChessPiece.create('wP'), 'a7')

    assert(piece.valid_move?('d4', 'b2', board), 'Bishop can capture opponent')
    assert(piece.valid_move?('d4', 'a7', board), 'Bishop can capture opponent')
    refute(piece.valid_move?('d4', 'e5', board), 'Bishop cannot capture friendly piece')
  end

  def test_exposed_check
    board = ChessBoard.new
    piece = ChessPiece.create('wB')
    board.add(piece, 'd4')

    board.add(ChessPiece.create('wK'), 'b2')
    board.add(ChessPiece.create('bB'), 'f6')

    refute(piece.valid_move?('d4', 'b6', board), 'Bishop cannot move to expose king to check')
    assert(piece.valid_move?('d4', 'f6', board), 'Bishop can capture threatening piece')
  end
end

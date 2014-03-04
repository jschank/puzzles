require 'minitest_helper'

# test chessboard functionality
class TestChesspiece < MiniTest::Test
  def test_that_it_can_recognize_invalid_piece_notations
    assert_raises(TypeError) { Chesspiece.create('bPwP') }
    assert_raises(TypeError) { Chesspiece.create('aP') }
    assert_raises(TypeError) { Chesspiece.create('bD') }
  end

  def test_that_it_can_recognize_opponents
    piece = Chesspiece.create('wP')

    assert(piece.is_opponent?(Chesspiece.create('bB')), 'Black piece is an opponent to white piece')
    refute(piece.is_opponent?(Chesspiece.create('wB')), 'White piece is not an opponent to white piece')
  end

  def test_that_it_can_recognize_friendly_pieces
    piece = Chesspiece.create('bP')

    assert(piece.is_friendly?(Chesspiece.create('bB')), 'Black piece is friendly to black piece')
    refute(piece.is_friendly?(Chesspiece.create('wB')), 'White piece is not friently to black piece')
  end

  def test_that_it_can_create_pawns
    piece = Chesspiece.create('bP')
    assert_kind_of(Pawn, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wP')
    assert_kind_of(Pawn, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_rooks
    piece = Chesspiece.create('bR')
    assert_kind_of(Rook, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wR')
    assert_kind_of(Rook, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_knights
    piece = Chesspiece.create('bN')
    assert_kind_of(Knight, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wN')
    assert_kind_of(Knight, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_bishops
    piece = Chesspiece.create('bB')
    assert_kind_of(Bishop, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wB')
    assert_kind_of(Bishop, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_queens
    piece = Chesspiece.create('bQ')
    assert_kind_of(Queen, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wQ')
    assert_kind_of(Queen, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_kings
    piece = Chesspiece.create('bK')
    assert_kind_of(King, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wK')
    assert_kind_of(King, piece)
    assert_equal(:white, piece.color)
  end
end

require_relative 'minitest_helper'

# test chessboard functionality
class TestChesspiece < MiniTest::Test
  def test_that_it_can_recognize_invalid_piece_notations
    assert_raises(TypeError) { ChessPiece.create('bPwP') }
    assert_raises(TypeError) { ChessPiece.create('aP') }
    assert_raises(TypeError) { ChessPiece.create('bD') }
  end

  def test_that_it_can_recognize_opponents
    piece = ChessPiece.create('wP')

    assert(piece.is_opponent?(ChessPiece.create('bB')), 'Black piece is an opponent to white piece')
    refute(piece.is_opponent?(ChessPiece.create('wB')), 'White piece is not an opponent to white piece')
  end

  def test_that_it_can_recognize_friendly_pieces
    piece = ChessPiece.create('bP')

    assert(piece.is_friendly?(ChessPiece.create('bB')), 'Black piece is friendly to black piece')
    refute(piece.is_friendly?(ChessPiece.create('wB')), 'White piece is not friently to black piece')
  end

  def test_that_it_correctly_reports_color_code
    assert_equal('b', ChessPiece.new(:black).color_code, "Reports Black pieces as 'b'")
    assert_equal('w', ChessPiece.new(:white).color_code, "Reports White pieces as 'w'")
    assert_raises(TypeError) {ChessPiece.new(:empty).color_code}
  end

  def test_that_the_base_class_cannot_determine_valid_moves
    assert_raises(NotImplementedError) {ChessPiece.new(:empty).valid_move?('a1', 'b1', ChessBoard.new)}
  end

  def test_that_it_can_create_pawns
    piece = ChessPiece.create('bP')
    assert_kind_of(Pawn, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wP')
    assert_kind_of(Pawn, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_rooks
    piece = ChessPiece.create('bR')
    assert_kind_of(Rook, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wR')
    assert_kind_of(Rook, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_knights
    piece = ChessPiece.create('bN')
    assert_kind_of(Knight, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wN')
    assert_kind_of(Knight, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_bishops
    piece = ChessPiece.create('bB')
    assert_kind_of(Bishop, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wB')
    assert_kind_of(Bishop, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_queens
    piece = ChessPiece.create('bQ')
    assert_kind_of(Queen, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wQ')
    assert_kind_of(Queen, piece)
    assert_equal(:white, piece.color)
  end

  def test_that_it_can_create_kings
    piece = ChessPiece.create('bK')
    assert_kind_of(King, piece)
    assert_equal(:black, piece.color)

    piece = ChessPiece.create('wK')
    assert_kind_of(King, piece)
    assert_equal(:white, piece.color)
  end
end

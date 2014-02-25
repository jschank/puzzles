require 'minitest_helper'

# test chessboard functionality
class TestChesspiece < MiniTest::Test
  def test_that_it_can_recognize_invalid_piece_notations
    assert_raises(InvalidPieceException) { Chesspiece.create('bPwP') }
    assert_raises(InvalidPieceException) { Chesspiece.create('aP') }
  end

  def test_that_it_can_create_pawns
    assert_kind_of(Pawn, Chesspiece.create('bP'))
    assert_equal(:black, Chesspiece.create('bP').color)
    assert_kind_of(Pawn, Chesspiece.create('wP'))
    assert_equal(:white, Chesspiece.create('wP').color)
  end
end

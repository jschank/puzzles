require 'minitest_helper'

# test chessboard functionality
class TestChesspiece < MiniTest::Test
  def test_that_it_can_recognize_invalid_piece_notations
    assert_raises(TypeError) { Chesspiece.create('bPwP') }
    assert_raises(TypeError) { Chesspiece.create('aP') }
  end

  def test_that_it_can_create_pawns
    piece = Chesspiece.create('bP')
    assert_kind_of(Pawn, piece)
    assert_equal(:black, piece.color)

    piece = Chesspiece.create('wP')
    assert_kind_of(Pawn, piece)
    assert_equal(:white, piece.color)
  end
end

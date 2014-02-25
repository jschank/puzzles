require 'minitest_helper'

# test chessboard functionality
class TestChessboard < MiniTest::Test
  def test_that_there_is_a_chessboard
    refute_nil Chessboard
  end

  def test_that_it_understands_algebraic_coordinates
    assert(Chessboard.valid? 'a1')
    assert(Chessboard.valid? 'a8')
    assert(Chessboard.valid? 'h1')
    assert(Chessboard.valid? 'h8')
    assert(Chessboard.valid? 'c5')
    refute(Chessboard.valid? 'j3')
    refute(Chessboard.valid? 'a0')
    refute(Chessboard.valid? 'a10')
  end

  def test_that_it_is_initially_empty
    board = Chessboard.new
    ('a'..'h').each do |file|
      ('1'..'8').each do |rank|
        refute(board.occupied?(file + rank))
      end
    end
  end

  def test_that_it_allows_pieces_to_be_placed_on_the_board
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'a1')
    assert(board.occupied?('a1'))
  end
end
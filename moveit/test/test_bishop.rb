require 'minitest_helper'

# test chessboard functionality
class TestBishop < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bB')
    assert_equal('bB', piece.show)

    piece = Chesspiece.create('wB')
    assert_equal('wB', piece.show)
  end
end

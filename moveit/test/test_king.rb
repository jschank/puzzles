require 'minitest_helper'

# test chessboard functionality
class TestKing < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bK')
    assert_equal('bK', piece.show)

    piece = Chesspiece.create('wK')
    assert_equal('wK', piece.show)
  end
end

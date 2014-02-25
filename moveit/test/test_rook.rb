require 'minitest_helper'

# test chessboard functionality
class TestRook < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bR')
    assert_equal('bR', piece.show)

    piece = Chesspiece.create('wR')
    assert_equal('wR', piece.show)
  end
end

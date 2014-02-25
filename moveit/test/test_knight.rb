require 'minitest_helper'

# test chessboard functionality
class TestKnight < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bN')
    assert_equal('bN', piece.show)

    piece = Chesspiece.create('wN')
    assert_equal('wN', piece.show)
  end
end

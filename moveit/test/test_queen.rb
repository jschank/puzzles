require 'minitest_helper'

# test chessboard functionality
class TestQueen < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bQ')
    assert_equal('bQ', piece.show)

    piece = Chesspiece.create('wQ')
    assert_equal('wQ', piece.show)
  end
end

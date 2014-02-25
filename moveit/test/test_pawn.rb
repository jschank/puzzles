require 'minitest_helper'

# test chessboard functionality
class TestPawn < MiniTest::Test
  def test_that_it_can_display_itself
    piece = Chesspiece.create('bP')
    assert_equal('bP', piece.show)

    piece = Chesspiece.create('wP')
    assert_equal('wP', piece.show)
  end

  def test_that_moving_forward_one_space_is_valid
  end

end

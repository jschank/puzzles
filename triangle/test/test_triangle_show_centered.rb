require 'minitest_helper'

# define test cases
class TestTriangleShowCentered < MiniTest::Test
  def test_that_it_outputs_nothing_when_given_0
    assert_output('') { Triangle.show_centered(0) }
  end

  def test_that_output_is_correct_when_given_1
    assert_output("1\n") { Triangle.show_centered(1) }
  end

  def test_that_output_is_correct_when_given_2
    assert_output(" 1\n2 3\n") { Triangle.show_centered(2) }
  end

  def test_that_output_is_correct_when_given_3
    assert_output("  1\n 2 3\n4 5 6\n") { Triangle.show_centered(3) }
  end

  def test_that_output_is_correct_when_given_4
    assert_output("   1\n  2 3\n 4 5 6\n7 8 9 10\n") { Triangle.show_centered(4) }
  end
end

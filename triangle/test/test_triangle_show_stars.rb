require 'minitest_helper'

# define test cases
class TestTriangleShowStars < MiniTest::Test
  def test_that_it_outputs_nothing_when_given_0
    assert_output('') { Triangle.show_stars(0) }
  end

  def test_that_output_is_correct_when_given_1
    assert_output("*\n") { Triangle.show_stars(1) }
  end

  def test_that_output_is_correct_when_given_2
    assert_output(" *\n**\n") { Triangle.show_stars(2) }
  end

  def test_that_output_is_correct_when_given_3
    assert_output("  *\n **\n***\n") { Triangle.show_stars(3) }
  end

  def test_that_output_is_correct_when_given_4
    assert_output("   *\n  **\n ***\n****\n") { Triangle.show_stars(4) }
  end
end

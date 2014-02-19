require 'minitest_helper'

# define test cases
class TestTriangleShow < MiniTest::Test
  def test_that_it_outputs_nothing_when_given_0
    @triangle = ::Triangle::Triangle.new(0)
    assert_output('') { @triangle.show }
  end

  def test_that_it_output_is_correct_when_given_1
    @triangle = ::Triangle::Triangle.new(1)
    assert_output("1\n") { @triangle.show }
  end

  def test_that_it_output_is_correct_when_given_2
    @triangle = ::Triangle::Triangle.new(2)
    assert_output("1\n2 3\n") { @triangle.show }
  end

  def test_that_it_output_is_correct_when_given_3
    @triangle = ::Triangle::Triangle.new(3)
    assert_output("1\n2 3\n4 5 6\n") { @triangle.show }
  end

  def test_that_it_output_is_correct_when_given_4
    @triangle = ::Triangle::Triangle.new(4)
    assert_output("1\n2 3\n4 5 6\n7 8 9 10\n") { @triangle.show }
  end
end

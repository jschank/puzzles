require 'minitest_helper'

# define test cases
class TestTriangle < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Triangle::VERSION
  end

  def test_that_it_reports_missing_input
    assert_raises(ArgumentError) { ::Triangle::Triangle.new(nil) }
  end

  def test_that_it_reports_invalid_input
    assert_raises(ArgumentError) { ::Triangle::Triangle.new(-4) }
  end
end

require_relative 'minitest_helper'

# Test main moveit classes
class TestMoveit < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MoveIt::VERSION
  end
end

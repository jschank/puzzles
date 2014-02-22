require 'minitest_helper'

# Test main moveit classes
class TestMoveit < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Moveit::VERSION
  end
end

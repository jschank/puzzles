require 'minitest_helper'

class VersionTest < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HittingRockBottom::VERSION
  end
end

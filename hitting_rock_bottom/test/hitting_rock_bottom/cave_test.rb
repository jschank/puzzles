require 'minitest_helper'

class CaveTest < MiniTest::Test
  def test_that_it_can_create_an_empty_cave
    c = Cave.new
    assert_equal("", c.to_s, "Can create an empty cave")
  end

  def test_that_it_can_create_an_airy_cave
    c = Cave.new(2,2,Cave::Air)
    assert_equal("  \n  ", c.to_s, "Can create a cave full of air")
  end

  def test_that_it_can_create_a_rocky_cave
    c = Cave.new(3,3,Cave::Rock)
    cave_str = <<-'EOS'.gsub(/^\s+/, '').chomp
    ###
    ###
    ###
    EOS
    assert_equal(cave_str, c.to_s, "Can create a cave full of rock")
  end

  def test_that_it_can_create_a_watery_cave
    c = Cave.new(4,5,Cave::Water)
    cave_str = <<-'EOS'.gsub(/^\s+/, '').chomp
    ~~~~~
    ~~~~~
    ~~~~~
    ~~~~~
    EOS
    assert_equal(cave_str, c.to_s, "Can create a cave full of water")
  end
end

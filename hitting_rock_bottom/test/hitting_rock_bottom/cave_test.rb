require 'minitest_helper'

class CaveTest < MiniTest::Test
  def test_that_it_can_create_an_empty_cave
    c = Cave.new
    assert_equal("", c.to_s, "Can create an empty cave")
  end

  def test_that_it_can_create_a_cave_from_array_of_strings
    cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
    #####
    ~   #
    # # #
    #####
    EOS
    c = Cave.new(cave_string.split("\n"))
    assert_equal(cave_string, c.to_s, 'Cave can be loaded from an array of strings')
  end

  def test_that_it_can_report_water_depths
    cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
    ################################
    ~~~~~~~~~~~~~~~                #
    #~~~~~~~~~####~~~~~~~~~~~~     #
    ###~~~~~~~####~~~~~~~~~~~~~~~~##
    ###~~~~~~~####~~~~~~~~~~~~~~####
    #######~~~#######~~~~~~~~~######
    #######~~~###########~~~~~######
    ################################
    EOS
    expected_depth_report = '1 2 2 4 4 4 4 6 6 6 1 1 1 1 4 3 3 4 4 4 4 5 5 5 5 5 2 2 1 1 0 0'
    c = Cave.new(cave_string.split("\n"))
    assert_equal(expected_depth_report, c.depth_report, 'Cave can report water depths')
  end

  # def test_that_it_can_add_water_to_right
  #   cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~     #
  #   #     #
  #   #     #
  #   #  #  #
  #   #######
  #   EOS
  #   c = Cave.new(cave_string.split("\n"))
  #
  #   c.add_water
  #   cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #     #
  #   #     #
  #   #  #  #
  #   #######
  #   EOS
  #   assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 1 unit of water added')
  # end

  # def test_that_it_can_add_water_down
  #   cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #     #
  #   #     #
  #   #  #  #
  #   #######
  #   EOS
  #   c = Cave.new
  #   c.load(cave_string.split("\n"))
  #
  #   c.add_water
  #   cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #~    #
  #   #     #
  #   #  #  #
  #   #######
  #   EOS
  #   assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 1 unit of water added')
  # end
  #
  # def test_that_it_can_add_water_at_bottom
  #   cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #~    #
  #   #~    #
  #   #~ #  #
  #   #######
  #   EOS
  #   c = Cave.new
  #   c.load(cave_string.split("\n"))
  #
  #   c.add_water
  #   cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #~    #
  #   #~    #
  #   #~~#  #
  #   #######
  #   EOS
  #   assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 1 unit of water added')
  # end
  #
  # def test_that_adding_water_raises_level
  #   cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #~    #
  #   #~    #
  #   #~~#  #
  #   #######
  #   EOS
  #   c = Cave.new
  #   c.load(cave_string.split("\n"))
  #
  #   c.add_water
  #   cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
  #   #######
  #   ~~    #
  #   #~    #
  #   #~~   #
  #   #~~#  #
  #   #######
  #   EOS
  #   assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 1 unit of water added')
  # end
end

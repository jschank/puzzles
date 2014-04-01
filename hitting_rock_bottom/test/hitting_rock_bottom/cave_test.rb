require 'minitest_helper'

class CaveTest < MiniTest::Test
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

  def test_that_it_can_add_water
    cave_string = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~     #
    #     #
    #     #
    #  #  #
    #######
    EOS
    c = Cave.new(cave_string.split("\n"))

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #     #
    #     #
    #  #  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 2nd unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #     #
    #  #  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 3rd unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~    #
    #  #  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 4th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~    #
    #~ #  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 5th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~    #
    #~~#  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 6th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~   #
    #~~#  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 7th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~~  #
    #~~#  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 8th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~~~ #
    #~~#  #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 9th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~~~ #
    #~~#~ #
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 10th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~~~ #
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 11th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~    #
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 12th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~~   #
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 13th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~~~  #
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 14th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~~~~ #
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 15th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~    #
    #~~~~~#
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 16th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~~   #
    #~~~~~#
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 17th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~~~  #
    #~~~~~#
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 18th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~~~~ #
    #~~~~~#
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 19th unit of water added')

    c.add_water
    cave_string_after_water_added = <<-'EOS'.gsub(/^\s+/, '').chomp
    #######
    ~~~~~~#
    #~~~~~#
    #~~~~~#
    #~~#~~#
    #######
    EOS
    assert_equal(cave_string_after_water_added, c.to_s, 'Cave is correct after 20th unit of water added')

    # when the cave is full it should raise an exception
    assert_raises(RuntimeError) { c.add_water }
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hitting_rock_bottom'
require 'hitting_rock_bottom/version'
require 'hitting_rock_bottom/grid'
require 'hitting_rock_bottom/cave'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

include HittingRockBottom

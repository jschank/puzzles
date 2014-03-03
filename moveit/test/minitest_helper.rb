$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'moveit'
require 'minitest/autorun'
require 'pry'

require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

include MoveIt

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'international_trade'

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use! [MiniTest::Reporters::DefaultReporter.new(:color => true)]

include InternationalTrade

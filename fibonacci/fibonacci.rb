module Fibonacci
  
  def self.fib_r(n)
    case n
      when (-1.0/0)..0 then 0
      when 1 then 1
      else fib_r(n-1) + fib_r(n-2)
    end
  end

  def self.sequence()
    Enumerator.new do |yielder|
      f0 = 0
      f1 = 1
      yielder.yield f0
      yielder.yield f1
      loop do
        fn = f1 + f0
        yielder.yield fn
        f0 = f1
        f1 = fn
      end
    end
  end
    
end

# require 'benchmark'
# include Benchmark
#
# n = 10
# Benchmark.benchmark(CAPTION, 15, FORMAT) do |x|
#   tc = x.report("Classic:") { n.times{FizzBuzz::classic}}
#   tm = x.report("Map:") {n.times{FizzBuzz::map_version}}
#   tn = x.report("No Conditionals:") {n.times{FizzBuzz::no_conditionals}}
# end

require 'minitest/autorun'

class TestLibraryFileName < MiniTest::Test
  def test_recursive_fibonacci
    assert_equal(0, Fibonacci.fib_r(-5))
    assert_equal(0, Fibonacci.fib_r(0))
    assert_equal(1, Fibonacci.fib_r(1))
    assert_equal(1, Fibonacci.fib_r(2))
    assert_equal(2, Fibonacci.fib_r(3))
    assert_equal(3, Fibonacci.fib_r(4))
    assert_equal(5, Fibonacci.fib_r(5))
    assert_equal(8, Fibonacci.fib_r(6))
    assert_equal(13, Fibonacci.fib_r(7))
    assert_equal(21, Fibonacci.fib_r(8))
  end
  
  def test_sequence_fibonacci
    assert_equal([0], Fibonacci.sequence.take(1))
    assert_equal([0, 1], Fibonacci.sequence.take(2))
    assert_equal([0, 1, 1], Fibonacci.sequence.take(3))
    assert_equal([0, 1, 1, 2], Fibonacci.sequence.take(4))
    assert_equal([0, 1, 1, 2, 3], Fibonacci.sequence.take(5))
    assert_equal([0, 1, 1, 2, 3, 5], Fibonacci.sequence.take(6))
    assert_equal([0, 1, 1, 2, 3, 5, 8], Fibonacci.sequence.take(7))
    assert_equal([0, 1, 1, 2, 3, 5, 8, 13], Fibonacci.sequence.take(8))
  end
  
end

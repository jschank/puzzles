module Euler
  
  def self.looped(n)
    sum = 0
    for i in 1...n
      if (i % 3 == 0 || i % 5 == 0)
        sum += i
      end
    end
    sum
  end
  
  def self.array_comprehensions(n)
    (1...n).select{ |i| i % 3 == 0 || i % 5 == 0 }.inject(&:+)
  end
  
  def self.no_loops(n)
    n = n - 1
    sum_3  = n/3  * (n/3  + 1) / 2 * 3
    sum_5  = n/5  * (n/5  + 1) / 2 * 5
    sum_15 = n/15 * (n/15 + 1) / 2 * 15 # because they'll be double counted
    
    sum_3 + sum_5 - sum_15
  end
    
end

require 'minitest/autorun'

class TestLibraryFileName < MiniTest::Test
  
  def test_method
    Euler.methods(false).each do |meth| 
      assert_equal(23, Euler.send(meth, 10), "for method #{meth}")
      assert_equal(233168, Euler.send(meth, 1000), "for method #{meth}")
    end
  end
  
  def test_fancy_works
    100.times do
      max = rand(10000)
      puts "Comparing sums for #{max}"
      sum = Euler.array_comprehensions(max)
      assert_equal(sum, Euler.fancy(max), "Comparison for max = #{max}")
    end
  end
  
    
end

# require 'benchmark'
# include Benchmark
#
# n = 3
# Benchmark.benchmark(CAPTION, 15, FORMAT) do |x|
#   tc = x.report("Recursive:") { n.times{Fibonacci.fib_r(30)}}
#   tm = x.report("Sequence:")  { n.times{Fibonacci::sequence.take(30)}}
# end

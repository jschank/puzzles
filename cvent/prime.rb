PRIMES_LESS_THAN_1000 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997]

$table = {}
module Prime
  # brute force the problem
  def self.isPrime_BruteForce(n)
    return false if n == 1
    return true if n == 2
    candidates = (2..n-1).to_a
    remainders = candidates.map { |c| n % c }
    remainders.none?{ |r| r == 0}
  end

  # skip evens
  def self.isPrime_Optimize1(n)
    return false if n == 1
    return true if n == 2
    return false if n.even?
    candidates = (3..n-1).to_a
    remainders = candidates.map { |c| n % c }
    remainders.none?{ |r| r == 0}
  end

  # fail fast
  def self.isPrime_FailFast(n)
    return false if n == 1
    return true if n == 2
    return false if n.even?
    3.upto(n-1) do |c|
      return false if n % c == 0
    end
  end

  # lookup
  # reuses uses fail fast
  def self.isPrime_Lookup(n)
    if (n < 1000)
      PRIMES_LESS_THAN_1000.include?(n)
    else
      isPrime_FailFast(n)
    end
  end

  # memoized table
  # reuses uses fail fast
  # uses global variable
  # stores ALL numbers checked - key = n, value = true|false
  def self.isPrime_Memoized(n)
    $table[n] || $table.store(n, self.isPrime_FailFast(n))
  end
end

require 'benchmark'
include Benchmark

n = 1000
Benchmark.benchmark(CAPTION, 15, FORMAT) do |x|
  t_bf = x.report("Brute Force:") {n.times{Prime.isPrime_BruteForce(Random.rand(1_000_000) + 1)}}
  # tm = x.report("Map:") {n.times{FizzBuzz::map_version}}
  # tn = x.report("No Conditionals:") {n.times{FizzBuzz::no_conditionals}}
end

require 'minitest/autorun'

class TestPrime < MiniTest::Test

  def test_brute_force
    proc = Proc.new{ |n| Prime.isPrime_BruteForce(n) }
    verify_primes(&proc)
  end

  def test_Optimize1
    proc = Proc.new{ |n| Prime.isPrime_Optimize1(n) }
    verify_primes(&proc)
  end

  def test_FailFast
    proc = Proc.new{ |n| Prime.isPrime_FailFast(n) }
    verify_primes(&proc)
  end

  def test_Lookup
    proc = Proc.new{ |n| Prime.isPrime_Lookup(n) }
    verify_primes(&proc)
  end

  def test_Memoized
    proc = Proc.new{ |n| Prime.isPrime_Memoized(n) }
    verify_primes(&proc)
    puts $table
  end

  def verify_primes(&block)
    # check first 100 primes
    primes = PRIMES_LESS_THAN_1000.select{ |p| p < 100}
    non_primes = (2..100).to_a - primes

    refute(block.call(1), "1 is not prime")
    assert(block.call(2), "2 is prime")
    assert(block.call(3), "3 is prime")
    refute(block.call(4), "4 is not prime")
    assert(block.call(5), "5 is prime")

    assert(primes.map(&block).all?, "Finds all primes")
    assert(non_primes.map(&block).none?, "Rejects all non-primes")
  end
end
module FizzBuzz
  def self.classic
    1.upto(100) do |i|
      if (i % 5 == 0) && (i % 3 == 0)
        puts "FizzBuzz"
      elsif (i % 5 == 0)
        puts "Buzz"
      elsif (i % 3 == 0)
        puts "Fizz"
      else
        puts i
      end
    end
  end

  def self.map_version
    array = (1..100).to_a
    array.map!{ |i| (i % 15) == 0 ? "FizzBuzz" : i }
    array.map!{ |i| (i % 3) == 0 ? "Fizz" : i }
    array.map!{ |i| (i % 5) == 0 ? "Buzz" : i }
    array.each{ |i| puts i}
  end

end

# FizzBuzz::classic

require 'minitest/autorun'

class TestLibraryFileName < MiniTest::Test
  def test_classic_fizzbuzz
    verify_fizzbuzz{FizzBuzz::classic}
  end

  def test_map_version_fizzbuzz
    verify_fizzbuzz{FizzBuzz::map_version}
  end

  def verify_fizzbuzz(&block)
    valid_output = "1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz\n16\n17\nFizz\n19\nBuzz\nFizz\n22\n23\nFizz\nBuzz\n26\nFizz\n28\n29\nFizzBuzz\n31\n32\nFizz\n34\nBuzz\nFizz\n37\n38\nFizz\nBuzz\n41\nFizz\n43\n44\nFizzBuzz\n46\n47\nFizz\n49\nBuzz\nFizz\n52\n53\nFizz\nBuzz\n56\nFizz\n58\n59\nFizzBuzz\n61\n62\nFizz\n64\nBuzz\nFizz\n67\n68\nFizz\nBuzz\n71\nFizz\n73\n74\nFizzBuzz\n76\n77\nFizz\n79\nBuzz\nFizz\n82\n83\nFizz\nBuzz\n86\nFizz\n88\n89\nFizzBuzz\n91\n92\nFizz\n94\nBuzz\nFizz\n97\n98\nFizz\nBuzz\n"
    assert_output(valid_output, nil, &block)
  end
end

require 'benchmark'
require './lib/zlorpian'

iterations = 1_000_000

append_arr = []
prepend_arr = []

Benchmark.bm(30) do |bm|
  
  bm.report("Appending Items to Array") do
    iterations.times do |i|
      append_arr << i
    end
  end
    
  bm.report("Prepending Items to Array") do
    iterations.times do |i|
      prepend_arr.unshift i
    end
  end
end
puts "Append: #{append_arr.take(10)}"
puts "Prepend: #{prepend_arr.take(10)}"

zlorpian = Zlorpian.new
Benchmark.bm(30) do |bm|
  
  bm.report("Recursive Zlorpinumeral") do
    iterations.times do |i|
      zlorpian.zlorpinumeral_recursive(i)
    end
  end
  
  bm.report("Non-Recursive Zlorpinumeral") do
    iterations.times do |i|
      zlorpian.zlorpinumeral_non_recursive(i)
    end
  end
end

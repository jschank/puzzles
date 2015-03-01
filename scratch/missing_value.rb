# take a sequence from 1 to n, and remove one number
# how do you find the missing number

N = 100

array = (1..N).to_a
array.shuffle!

missing_value = array.shift

xor = (N % 4 == 0) ? N : (N % 4 == 1) ? 1 : (N % 4 == 2) ? N + 1 : 0;

missing_number = array.inject(xor) { |acc, n| acc = acc ^ n }

puts "Number removed = #{missing_value}"
puts "Calculated missing value = #{missing_number}"

# my method...
total = N * (N+1) / 2
sum = array.inject(&:+)
missing_number = total - sum

puts "MY Calculated missing value = #{missing_number}"

100.times do |i|
  i += 1
  if i % 15 == 0
    puts "FooBar"
  elsif i % 5 == 0
    puts "Bar"
  elsif i % 3 == 0
    puts "Foo"
  else
    puts i
  end
end

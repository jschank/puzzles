class Bar
  def select
    [1,2,3].to_enum
  end
end

puts Bar.new.select.select {|x| x > 1; puts "#{x} - #{x > 1}"} #.first

# puts [1,2,3].select {|x| x > 1}.first

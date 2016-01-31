#!/usr/bin/env ruby

class Array
  def to_num
    self.reduce(0) { |acc, i| (acc * 10**(i.to_s.length)) + i }
  end
end

def biggest_num(list)
  return list.permutation.map(&:to_num).max
end

list = [5, 2, 1, 9, 50, 56]
# list = [50, 2, 1, 9]
# list = [5, 50, 56]
puts "The List"
puts list.map(&:to_s).join(", ")
puts
puts "Biggest num = #{biggest_num(list)}"
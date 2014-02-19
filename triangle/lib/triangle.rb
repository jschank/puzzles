require 'triangle/version'

# Create an application that will take a number in Terminal
# and output the same number of lines with the same number
# of digits in each line.
# Note: elements continue to grow in order.
#
# Enter in terminal:
# $ ruby triangle.rb 4
# Expected result:
# (Line|output)
# 1|1
# 2|2 3
# 3|4 5 6
# 4|7 8 9 10
module Triangle
  # Class to implement the triangle puzzle
  class Triangle
    def initialize(rows)
      fail(ArgumentError, 'Must pass in number of rows to output') if rows.nil?
      fail(ArgumentError, 'Number of rows must be positive') if rows < 0
      @rows = rows
    end

    def show
      lines.each { |l| puts l }
    end

    def show_centered
      rows = lines
      widest_length = (rows.last || '').length
      # pad all other rows
      rows[0..-1].each do |row|
        diff = widest_length - row.length
        pad = diff / 2
        row.prepend(' ' * pad)
      end
      rows.each { |r| puts r }
    end

    private

    def lines
      num = 0
      lines = []
      @rows.times do |i|
        arr = []
        (i + 1).times { arr << (num = num.succ) }
        lines << arr.join(' ')
      end
      lines
    end
  end
end

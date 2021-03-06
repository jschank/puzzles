#     +---+
#     | 1 |
# +---+---+---+
# | 2 | 3 | 4 |
# +---+---+---+
# | 5 | 6 | 7 |
# +---+---+---+
#     | 8 |
#     +---+
# 
# Take the numbers 1 through 8, and place them in the cells in the diagram above
# The only rule is that there can be no sequential numbers in adjacent cells...
# (up, down, left, right, and diagonal)
# 
# for example 4 in cell 1, and 5 in cell 2 would be prohibited, but 4 in cell 1, and 6 in cell 2
# would be ok.

# original checks completed the whole search in 0.43 seconds. BUT, I think it can be improved.
# The sequence checks currently do some checks multiple times. Really all we need is an array of 
# all of the Adjacent pairs. Tried it, and it does work - shaves 0.03 sec off of the time. BUT
# I prefer the slower hash based sequence checks because it gives insight into how to arrive at
# a solution, because it exposes that some cells are more difficult to fill than others.
SEQUENCE_CHECKS = {
  1 => [2, 3, 4],
  2 => [1, 3, 5, 6],
  3 => [1, 2, 4, 5, 6, 7],
  4 => [1, 3, 6, 7],
  5 => [2, 3, 6, 8],
  6 => [2, 3, 4, 5, 7, 8],
  7 => [3, 4, 6, 8],
  8 => [5, 6, 7]  
}

# to display the valid solutions
def render(num, array)
  puts
  puts "Solution #{num+1}"
  puts "    +---+    "
  puts "    | #{array[0]} |    "
  puts "+---+---+---+"
  puts "| #{array[1]} | #{array[2]} | #{array[3]} |"
  puts "+---+---+---+"
  puts "| #{array[4]} | #{array[5]} | #{array[6]} |"
  puts "+---+---+---+"
  puts "    | #{array[7]} |    "
  puts "    +---+    "
end

# solution is valid if all of the SEQUENCE_CHECKS work out
# to verify them: for each key, grab the value at that index, and compare it to all of the values
# at the indexes in the value for the key. None of them can be in sequence (ie. have a delta of 1)
def check_solution(possible_values)
  # possible.value_at(key) compared to 
  # possible.value_at(*value) => array of values from possible given array of indexes in "value"
  # if any of the value_at values, are +- 1 from comparison value, then this fails.
  SEQUENCE_CHECKS.any? do |check_cell_id, adjacent_cell_ids|
    # must convert the cell_ids to indexes 
    cell_index = check_cell_id - 1
    adjacent_indexes = adjacent_cell_ids.map{ |id| id - 1 }

    # retrieve the values for those indexes
    cell_value = possible_values[cell_index]
    adjacent_values = possible_values.values_at(*adjacent_indexes)

    # see if any of the adjacent values are in sequence with the check cell
    adjacent_values.any? { |v| (cell_value - v).abs == 1 }
  end
end

# all possible arrangements...
possibles = (1..8).to_a.permutation

# reject any that are invalid...
solutions = possibles.reject{ |p| check_solution(p) }

puts "There are #{possibles.count} ways to fill out the grid..."
puts "There are #{solutions.length} valid solutions:"

# print out the solutions
solutions.each_with_index { |s, i| render(i, s) }
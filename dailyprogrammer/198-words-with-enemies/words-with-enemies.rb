#!/usr/bin/env ruby
require 'text-table'

table = Text::Table.new
table.head = ['Left Side Word', 'Right Side Word', 'Left Side Letters', 'Right Side Letters', 'Victor']
DATA.each_line do |l|
  left_side_word, right_side_word = l.split
  left_side_chars = left_side_word.chars
  right_side_chars = right_side_word.chars

  right_side_letters = left_side_chars.reduce(right_side_chars.dup) do |acc, lc|
    # accumulator should end up being the residue for the rhs word
    index = acc.find_index(lc)
    acc.delete_at(index) if index
    acc
  end
    
  left_side_letters = right_side_chars.reduce(left_side_chars.dup) do |acc, rc|
    # accumulator should end up being the residue for the lhs word
    index = acc.find_index(rc)
    acc.delete_at(index) if index
    acc
  end

  victor = 
    case(left_side_letters.length <=> right_side_letters.length)
      when -1 then "Right"
      when 0  then "Tie"
      when 1 then "Left"
    end
  
  table.rows << [left_side_word, right_side_word, left_side_letters.join, right_side_letters.join, victor]
end

puts table

__END__
because cause
hello below
hit miss
rekt pwn
combo jumbo
critical optical
isoenzyme apoenzyme
tribesman brainstem
blames nimble
yakuza wizard
longbow blowup
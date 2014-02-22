# Chessboard - manages the state of the board
class Chessboard
  RANKS = ('1'..'8').to_a
  FILES = ('a'..'h').to_a

  def self.valid?(algebraic_coordinate)
    algebraic_coordinate.length == 2 &&
    FILES.include?(algebraic_coordinate[0]) &&
    RANKS.include?(algebraic_coordinate[1])
  end

  def occupied?(algebraic_coordinate)
    false
  end
end

module MoveIt
  # Chessboard - manages the state of the board
  class Chessboard
    RANKS = ('1'..'8').to_a
    FILES = ('a'..'h').to_a

    def initialize
      @board = {}
    end

    def self.valid?(algebraic_coordinate)
      algebraic_coordinate.length == 2 &&
      FILES.include?(algebraic_coordinate[0]) &&
      RANKS.include?(algebraic_coordinate[1])
    end

    def add(piece, algebraic_coordinate)
      @board[algebraic_coordinate] = piece
    end

    def occupied?(algebraic_coordinate)
      !!@board[algebraic_coordinate]
    end
  end
end

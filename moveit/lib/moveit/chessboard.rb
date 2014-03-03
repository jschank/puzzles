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

    def piece_at(algebraic_coordinate)
      @board[algebraic_coordinate]
    end

    def self.same_rank?(start, target)
      start[1] == target[1]
    end

    def self.same_file?(start, target)
      start[0] == target[0]
    end

    def self.same_diagonal?(start, target)
      (start.bytes[0] - target.bytes[0]).abs == (start.bytes[1] - target.bytes[1]).abs
    end

    # note: this isn't a precise cartesian distance, it is just the number of spaces along a
    # rank, file, or diagonal
    def self.distance_between(start, target)
      rank_distance = (start.bytes[1] - target.bytes[1]).abs
      file_distance = (start.bytes[0] - target.bytes[0]).abs
      [rank_distance, file_distance].max
    end

  end
end

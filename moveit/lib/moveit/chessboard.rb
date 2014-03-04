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

    def path_clear?(start, target)
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

    def impediments?(start, target)
      path = Chessboard.make_path(start, target)
      pieces = path.map {|coordinate| piece_at(coordinate)}
      middle = pieces.slice(1..-2)
      middle.compact.count != 0
    end

    def self.make_path(start, target)
      if same_rank?(start, target)
        build_rank_path(start, target)
      elsif same_file?(start, target)
        build_file_path(start, target)
      elsif same_diagonal?(start, target)
        build_diagonal_path(start, target)
      else
        fail(ArgumentError, "#{start} and #{target} are not on the same rank, file, or diagonal", caller)
      end
    end

    # note: this isn't a precise cartesian distance, it is just the number of spaces along a
    # rank, file, or diagonal
    def self.distance_between(start, target)
      rank_distance = (start.bytes[1] - target.bytes[1]).abs
      file_distance = (start.bytes[0] - target.bytes[0]).abs
      [rank_distance, file_distance].max
    end

    private

    def self.build_file_path(start, target)
      path = []
      distance = distance_between(start, target)
      cur_pos = [start, target].min.dup
      distance.times do
        path << cur_pos
        cur_pos = cur_pos.dup
        cur_pos[1] = cur_pos[1].succ
      end
      path << [start, target].max.dup
      path = (start < target) ? path : path.reverse
    end

    def self.build_rank_path(start, target)
      path = []
      distance = distance_between(start, target)
      cur_pos = [start, target].min.dup
      distance.times do
        path << cur_pos
        cur_pos = cur_pos.dup
        cur_pos[0] = cur_pos[0].succ
      end
      path << [start, target].max.dup
      path = (start < target) ? path : path.reverse
    end

    def self.build_diagonal_path(start, target)
      path = []
      distance = distance_between(start, target)
      cur_pos = [start, target].min.dup
      distance.times do
        path << cur_pos
        cur_pos = cur_pos.dup
        cur_pos[0] = cur_pos[0].succ
        cur_pos[1] = cur_pos[1].succ
      end
      path << [start, target].max.dup
      path = (start < target) ? path : path.reverse
    end

  end
end

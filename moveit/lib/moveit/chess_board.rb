module MoveIt
  # Chessboard - manages the state of the board
  class ChessBoard
    RANKS = ('1'..'8').to_a
    FILES = ('a'..'h').to_a

    # @param [ChessBoard] board
    def initialize(board = nil)
      @board = board || {}
    end

    def clone
      ChessBoard.new(@board.clone)
    end

    def to_s
      rows = []
      RANKS.reverse.each do |rank|
        row = []
        FILES.each do |file|
          coords = file + rank
          piece = piece_at(coords) || NilPiece.new(:empty)
          row << piece
        end
        rows << row.map(&:to_s).join(' ')
      end
      rows.join("\n")
    end

    def load(filepath)
      rank_order = RANKS.reverse
      File.readlines(filepath).each_with_index do |line, index|
        rank = rank_order[index]
        line.split.each_with_index do |piece_code, file_index|
          coord = FILES[file_index] + rank
          if piece_code != '--'
            piece = ChessPiece.create(piece_code)
            add(piece, coord)
          end
        end
      end
    end

    def self.valid?(algebraic_coordinate)
      algebraic_coordinate.length == 2 &&
      FILES.include?(algebraic_coordinate[0]) &&
      RANKS.include?(algebraic_coordinate[1])
    end

    def valid_move?(start, target)
      fail ArgumentError, "No piece exists at #{start}", caller unless occupied?(start)
      piece = piece_at(start)
      piece.valid_move?(start, target, self)
    end

    def add(piece, algebraic_coordinate)
      @board[algebraic_coordinate] = piece
    end

    def remove(algebraic_coordinate)
      piece = piece_at(algebraic_coordinate)
      @board.delete(algebraic_coordinate)
      piece
    end

    def occupied?(algebraic_coordinate)
      piece_at(algebraic_coordinate) != nil
    end

    def coordinates_for_piece_code(code)
      all_pieces = piece_coordinates
      pieces = all_pieces.keys.select { |piece| piece.to_s == code}
      coords = pieces.map { |piece| all_pieces[piece] }
      coords.flatten.sort
    end

    def coordinates_for_all_pieces_of_color(color)
      all_pieces = piece_coordinates
      pieces = all_pieces.keys.select { |piece| piece.color == color}
      coords = pieces.map { |piece| all_pieces[piece] }
      coords.flatten.sort
    end

    def path_clear?(start, target)
      path = ChessBoard.make_path(start, target)
      pieces = path.map {|coordinate| piece_at(coordinate)}
      middle = pieces.slice(1..-2)
      middle.compact.count == 0
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

    def self.change_in_coordinates(start, target)
      file_distance = (start.bytes[0] - target.bytes[0]).abs
      rank_distance = (start.bytes[1] - target.bytes[1]).abs
      [file_distance, rank_distance]
    end

    private

    def piece_coordinates
      found_pieces = {}
      FILES.each do |file|
        RANKS.each do |rank|
          coordinate = file + rank
          piece = piece_at(coordinate)
          found_pieces[piece] = coordinate if piece
        end
      end
      found_pieces
    end

    def self.build_file_path(start, target)
      path = []
      change = change_in_coordinates(start, target)
      cur_pos = [start, target].min.dup
      change[1].times do
        path << cur_pos
        cur_pos = cur_pos.dup
        cur_pos[1] = cur_pos[1].succ
      end
      path << [start, target].max.dup
      (start < target) ? path : path.reverse
    end

    def self.build_rank_path(start, target)
      path = []
      change = change_in_coordinates(start, target)
      cur_pos = [start, target].min.dup
      change[0].times do
        path << cur_pos
        cur_pos = cur_pos.dup
        cur_pos[0] = cur_pos[0].succ
      end
      path << [start, target].max.dup
      (start < target) ? path : path.reverse
    end

    def self.build_diagonal_path(start, target)
      path = []
      rank_change_operator = (target[1] <=> start[1]) # to go from start to target, I add, 1, 0, -1
      file_change_operator = (target[0] <=> start[0])

      start_rank_index = RANKS.index(start[1])
      start_file_index = FILES.index(start[0])

      target_rank_index = RANKS.index(target[1])
      target_file_index = FILES.index(target[0])

      file_indexes = start_file_index.step(target_file_index, file_change_operator).to_a
      rank_indexes = start_rank_index.step(target_rank_index, rank_change_operator).to_a

      index_coords = file_indexes.zip(rank_indexes)

      index_coords.each do |icoord|
        path << FILES[icoord[0]] + RANKS[icoord[1]]
      end
      path
    end
  end
end

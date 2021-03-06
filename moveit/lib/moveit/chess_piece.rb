module MoveIt
  # Chesspiece - manages the chess pieces
  class ChessPiece
    VALID_PIECES = %W(bP bR bN bB bQ bK wP wR wN wB wQ wK)
    def self.create(piece_notation)
      validate_request(piece_notation)
      color = piece_notation[0] == 'b' ? :black : :white
      case piece_notation[1]
      when 'P' then Pawn.new(color)
      when 'R' then Rook.new(color)
      when 'N' then Knight.new(color)
      when 'B' then Bishop.new(color)
      when 'Q' then Queen.new(color)
      when 'K' then King.new(color)
      end
    end

    def initialize(color)
      @color = color
    end

    def color_code
      case @color
      when :black then 'b'
      when :white then 'w'
      else fail TypeError, "#{@color} is not a valid color", caller
      end
    end

    def is_opponent?(chesspiece)
      chesspiece.color != @color
    end

    def is_friendly?(chesspiece)
      chesspiece.color == @color
    end

    def valid_move?(start, target, board)
      fail NotImplementedError, 'valid_move? should be called on a concrete sub-class', caller
    end

    def king_safe(start, target, board)
      my_king_code = (self.color == :white) ? 'wK' : 'bK'

      post_move_board = board.clone
      post_move_board.remove(target)
      moved_piece = post_move_board.remove(start)
      post_move_board.add(moved_piece, target)

      my_king_coords = post_move_board.coordinates_for_piece_code(my_king_code).first # there is only one king after all
      return true unless my_king_coords # if there is no king on the board, it can't be in jeopardy

      opponent_color = (self.color == :white) ? :black : :white
      all_opponent_coords = post_move_board.coordinates_for_all_pieces_of_color(opponent_color)
      safe = all_opponent_coords.none? { |coord| post_move_board.valid_move?(coord, my_king_coords) }
    end

    attr_reader :color

    private

    def self.validate_request(piece_notation)
      signal_invalid_piece(piece_notation) unless VALID_PIECES.include? piece_notation
    end

    def self.signal_invalid_piece(piece_notation)
      fail TypeError, "#{piece_notation} does not represent a valid chess piece", caller
    end
  end
end

module MoveIt
  # Chesspiece - manages the chess pieces
  class Chesspiece
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

    def valid_move?(start, target, board)
      fail NotImplementedError, 'valid_move? should be called on a concrete sub-class', caller
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

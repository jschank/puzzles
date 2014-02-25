module MoveIt
  # Chesspiece - manages the chess pieces
  class Chesspiece
    VALID_PIECES = %W(bP bR bN bB bQ bK wP wR wN wB wQ wK)
    def self.create(piece_notation)
      validate_request(piece_notation)
      color = piece_notation[0] == 'b' ? :black : :white
      case piece_notation[1]
      when 'P' then Pawn.new(color)
      # when 'R' then Rook.new(color)
      # when 'N' then Knight.new(color)
      # when 'B' then Bishop.new(color)
      # when 'Q' then Queen.new(color)
      # when 'K' then King.new(color)
      end
    end

    def initialize(color)
      @color = color
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

  # Pawn piece - can move forward one space at a time, along a single file
  # unless on home row - then it can move up to three spaces forward
  # can capture a piece if it is forward, and on the next or previous file
  class Pawn < Chesspiece
  end
end

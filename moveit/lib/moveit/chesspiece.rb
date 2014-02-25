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

  # Rook piece - can move to any space in the same rank, or file
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Rook < Chesspiece
  end

  # Knight piece - Moves in an "L" shape:
  # two spaces along rank or file, then 1 space along file or rank (respectively)
  # Not Blocked by enemy pieces
  # Not Blocked by friendly pieces
  class Knight < Chesspiece
  end

  # Bishop piece - Moves along diagonals
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Bishop < Chesspiece
  end

  # Queen piece - Moves as bishop or rook
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Queen < Chesspiece
  end

  # King piece - Moves 1 space in any direction
  # cannot move into, or through jeopardy (check)
  class King < Chesspiece
  end
end

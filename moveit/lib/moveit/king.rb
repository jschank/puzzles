module MoveIt
  # King piece - Moves 1 space in any direction
  # cannot move into, or through jeopardy (check)
  class King < ChessPiece
    def to_s
      color_code + 'K'
    end

    def valid_move?(start, target, board)
      (ChessBoard.change_in_coordinates(start, target).max == 1) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end
  end
end

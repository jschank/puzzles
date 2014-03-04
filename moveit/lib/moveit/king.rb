module MoveIt
  # King piece - Moves 1 space in any direction
  # cannot move into, or through jeopardy (check)
  class King < Chesspiece
    def show
      color_code + 'K'
    end

    def valid_move?(start, target, board)
      (Chessboard.distance_between(start, target) == 1) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end

  end
end

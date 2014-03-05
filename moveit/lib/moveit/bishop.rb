module MoveIt
  # Bishop piece - Moves along diagonals
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Bishop < Chesspiece
    def to_s
      color_code + 'B'
    end

    def valid_move?(start, target, board)
      Chessboard.same_diagonal?(start, target) &&
      board.path_clear?(start, target) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end
  end
end

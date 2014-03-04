module MoveIt
  # Bishop piece - Moves along diagonals
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Bishop < Chesspiece
    def show
      color_code + 'B'
    end

    def valid_move?(start, target, board)
      true
      # (valid_forward_move?(start, target, board) ||
      # valid_forward_capture?(start, target, board)) &&
      # board.path_clear?(start, target) &&
      # king_safe(start, target, board)
    end

  end
end

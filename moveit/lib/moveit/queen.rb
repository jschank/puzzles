module MoveIt
  # Queen piece - Moves as bishop or rook
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Queen < Chesspiece
    def show
      color_code + 'Q'
    end

    def valid_move?(start, target, board)
      (Chessboard.same_rank?(start, target) ||
       Chessboard.same_file?(start, target) ||
       Chessboard.same_diagonal?(start, target)) &&
      board.path_clear?(start, target) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end
  end
end

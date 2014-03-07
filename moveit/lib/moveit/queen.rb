module MoveIt
  # Queen piece - Moves as bishop or rook
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Queen < ChessPiece
    def to_s
      color_code + 'Q'
    end

    def valid_move?(start, target, board)
      (ChessBoard.same_rank?(start, target) ||
       ChessBoard.same_file?(start, target) ||
       ChessBoard.same_diagonal?(start, target)) &&
      board.path_clear?(start, target) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end
  end
end

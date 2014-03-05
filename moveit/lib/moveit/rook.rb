module MoveIt
  # Rook piece - can move to any space in the same rank, or file
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Rook < Chesspiece
    def to_s
      color_code + 'R'
    end

    def valid_move?(start, target, board)
      (Chessboard.same_rank?(start, target) || Chessboard.same_file?(start, target)) &&
      board.path_clear?(start, target) &&
      (!board.occupied?(target) || self.is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end
  end
end

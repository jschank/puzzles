module MoveIt
  # Knight piece - Moves in an "L" shape:
  # two spaces along rank or file, then 1 space along file or rank (respectively)
  # Not Blocked by enemy pieces
  # Not Blocked by friendly pieces
  class Knight < Chesspiece
    def to_s
      color_code + 'N'
    end

    def valid_move?(start, target, board)
      (is_knight_move?(start, target)) &&
      (!board.occupied?(target) || is_opponent?(board.piece_at(target))) &&
      king_safe(start, target, board)
    end

    private

    def is_knight_move?(start, target)
      change = Chessboard.change_in_coordinates(start, target)
      (change == [1, 2] || change == [2, 1])
    end
  end
end

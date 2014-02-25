module MoveIt
  # Rook piece - can move to any space in the same rank, or file
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Rook < Chesspiece
    def show
      color_code + 'R'
    end
  end
end

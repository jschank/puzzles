module MoveIt
  # Bishop piece - Moves along diagonals
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Bishop < Chesspiece
    def show
      color_code + 'B'
    end
  end
end

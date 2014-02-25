module MoveIt
  # Queen piece - Moves as bishop or rook
  # Blocked by enemy pieces
  # Blocked by friendly pieces
  class Queen < Chesspiece
    def show
      color_code + 'Q'
    end
  end
end

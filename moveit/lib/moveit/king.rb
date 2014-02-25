module MoveIt
  # King piece - Moves 1 space in any direction
  # cannot move into, or through jeopardy (check)
  class King < Chesspiece
    def show
      color_code + 'K'
    end
  end
end

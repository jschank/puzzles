module MoveIt
  # Knight piece - Moves in an "L" shape:
  # two spaces along rank or file, then 1 space along file or rank (respectively)
  # Not Blocked by enemy pieces
  # Not Blocked by friendly pieces
  class Knight < Chesspiece
    def show
      color_code + 'N'
    end
  end
end

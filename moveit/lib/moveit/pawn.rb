module MoveIt
  # Pawn piece - can move forward one space at a time, along a single file
  # unless on home row - then it can move up to three spaces forward
  # can capture a piece if it is forward, and on the next or previous file
  class Pawn < Chesspiece
    def show
      color_code + 'P'
    end
  end
end

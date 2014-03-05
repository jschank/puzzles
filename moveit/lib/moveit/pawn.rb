module MoveIt
  # Pawn piece - can move forward one space at a time, along a single file
  # unless on home row - then it can move up to three spaces forward
  # can capture a piece if it is forward, and on the next or previous file
  class Pawn < Chesspiece
    def to_s
      color_code + 'P'
    end

    def valid_move?(start, target, board)
      (valid_forward_move?(start, target, board) ||
      valid_forward_capture?(start, target, board)) &&
      board.path_clear?(start, target) &&
      king_safe(start, target, board)
    end

    def forward?(start, target)
      file_distance = target.bytes[1] - start.bytes[1]
      (file_distance > 0 && color == :white) || (file_distance < 0 && color == :black)
    end

    def home?(coordinate)
      (coordinate[1] == '2' && color == :white) || (coordinate[1] == '7' && color == :black)
    end

    private

    def valid_forward_move?(start, target, board)
      !board.occupied?(target) &&
      forward?(start, target) && Chessboard.same_file?(start, target) &&
      ((home?(start) && Chessboard.change_in_coordinates(start, target)[1] <= 2) ||
      (Chessboard.change_in_coordinates(start, target)[1] == 1))
    end

    def valid_forward_capture?(start, target, board)
      board.occupied?(target) &&
      board.piece_at(target).color != self.color &&
      forward?(start, target) &&
      Chessboard.same_diagonal?(start, target) && Chessboard.change_in_coordinates(start, target)[1] == 1
    end


  end
end

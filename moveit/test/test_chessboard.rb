require_relative 'minitest_helper'

# test chessboard functionality
class TestChessboard < MiniTest::Test
  def test_that_there_is_a_chessboard
    refute_nil Chessboard
  end

  def test_that_it_understands_algebraic_coordinates
    assert(Chessboard.valid? 'a1')
    assert(Chessboard.valid? 'a8')
    assert(Chessboard.valid? 'h1')
    assert(Chessboard.valid? 'h8')
    assert(Chessboard.valid? 'c5')
    refute(Chessboard.valid? 'j3')
    refute(Chessboard.valid? 'a0')
    refute(Chessboard.valid? 'a10')
  end

  def test_that_it_is_initially_empty
    board = Chessboard.new
    ('a'..'h').each do |file|
      ('1'..'8').each do |rank|
        refute(board.occupied?(file + rank))
      end
    end
  end

  def test_that_it_can_be_cloned
    board = Chessboard.new
    board.add(Chesspiece.create('wR'), 'a1')
    board.add(Chesspiece.create('wP'), 'a2')
    board.add(Chesspiece.create('wN'), 'b1')
    board.add(Chesspiece.create('wP'), 'b2')
    cloned_board = board.clone
    piece = cloned_board.remove('b2')

    assert_equal('wP', piece.to_s)
    assert(board.occupied?('b2'))
    refute(cloned_board.occupied?('b2'))
  end

  def test_that_it_allows_pieces_to_be_placed_on_the_board
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'a1')
    assert(board.occupied?('a1'))
  end

  def test_that_it_returns_correct_piece_given_coordinates
    board = Chessboard.new
    board.add(Chesspiece.create('wR'), 'd5')
    piece = board.piece_at('d5')
    assert_kind_of(Rook, piece)
    assert_equal(:white, piece.color)
    assert(board.occupied?('d5'))
  end

  def test_that_it_allows_pieces_to_be_removed_from_the_board
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'a1')
    assert(board.occupied?('a1'))
    removed_piece = board.remove('a1')
    refute(board.occupied?('a1'))
    assert_equal(piece, removed_piece, "Removal returns removed piece")
  end

  def test_that_it_can_determine_valid_moves
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'b7')

    assert(board.valid_move?('b7', 'b6'))
    assert_raises(ArgumentError) {board.valid_move?('e4', 'e5')}
  end

  def test_that_it_knows_coordinates_are_on_same_rank
    assert(Chessboard.same_rank?('b1', 'f1'), "two points on same rank")
    assert(Chessboard.same_rank?('f1', 'b1'), "two points on same rank")
    refute(Chessboard.same_rank?('b1', 'b6'), "two points NOT on same rank")
    refute(Chessboard.same_rank?('b6', 'b1'), "two points NOT on same rank")
  end

  def test_that_it_knows_coordinates_are_on_same_file
    assert(Chessboard.same_file?('b1', 'b8'), "two points on same file")
    assert(Chessboard.same_file?('b8', 'b1'), "two points on same file")
    refute(Chessboard.same_file?('b1', 'g1'), "two points NOT on same file")
    refute(Chessboard.same_file?('g1', 'b1'), "two points NOT on same file")
  end

  def test_that_it_knows_coordinates_are_on_same_diagonal
    assert(Chessboard.same_diagonal?('b1', 'e4'), "two points on same diagonal")
    assert(Chessboard.same_diagonal?('e4', 'b1'), "two points on same diagonal")
    refute(Chessboard.same_diagonal?('b1', 'e2'), "two points NOT on same diagonal")
    refute(Chessboard.same_diagonal?('e2', 'b1'), "two points NOT on same diagonal")
  end

  def test_that_it_can_build_a_path_of_coordinates
    assert_equal(['d4', 'd5', 'd6', 'd7'], Chessboard.make_path('d4', 'd7'), "Path from d4 to d7")
    assert_equal(['d4', 'c5', 'b6', 'a7'], Chessboard.make_path('d4', 'a7'), "Path from d4 to a7")
    assert_equal(['d4', 'c4', 'b4', 'a4'], Chessboard.make_path('d4', 'a4'), "Path from d4 to a4")
    assert_equal(['d4', 'c3', 'b2', 'a1'], Chessboard.make_path('d4', 'a1'), "Path from d4 to a1")
    assert_equal(['d4', 'd3', 'd2', 'd1'], Chessboard.make_path('d4', 'd1'), "Path from d4 to d1")
    assert_equal(['d4', 'e3', 'f2', 'g1'], Chessboard.make_path('d4', 'g1'), "Path from d4 to g1")
    assert_equal(['d4', 'e4', 'f4', 'g4'], Chessboard.make_path('d4', 'g4'), "Path from d4 to g4")
    assert_equal(['d4', 'e5', 'f6', 'g7'], Chessboard.make_path('d4', 'g7'), "Path from d4 to g7")
    assert_raises(ArgumentError) {Chessboard.make_path('a1', 'd2')}
  end

  def test_that_it_can_detect_clear_path
    board = Chessboard.new
    board.add(Chesspiece.create('wP'), 'c2')
    board.add(Chesspiece.create('wR'), 'e2')

    assert(board.path_clear?('c2', 'd2'))
    assert(board.path_clear?('c2', 'e2'))
    refute(board.path_clear?('c2', 'f2'))
  end

  def test_that_it_can_find_pieces_by_code
    board = Chessboard.new
    board.add(Chesspiece.create('wP'), 'a2')
    board.add(Chesspiece.create('wR'), 'a1')
    board.add(Chesspiece.create('wP'), 'g2')
    board.add(Chesspiece.create('wR'), 'g1')

    assert_equal([], board.coordinates_for_piece_code('wK'), "Cannot find piece not on board")
    assert_equal(['a1', 'g1'], board.coordinates_for_piece_code('wR'), "Find white rooks")
  end

  def test_that_it_can_find_pieces_color
    board = Chessboard.new
    board.add(Chesspiece.create('wP'), 'a2')
    board.add(Chesspiece.create('wR'), 'a1')
    board.add(Chesspiece.create('wP'), 'g2')
    board.add(Chesspiece.create('wR'), 'g1')

    assert_equal([], board.coordinates_for_all_pieces_of_color(:black), "There are no black pieces")
    assert_equal(['a1', 'a2', 'g1', 'g2'], board.coordinates_for_all_pieces_of_color(:white), "Find white pieces")
  end

  def test_that_it_can_return_change_in_coordinates
    assert_equal([2, 1], Chessboard.change_in_coordinates('d4', 'f5'))
    assert_equal([1, 2], Chessboard.change_in_coordinates('d4', 'c6'))
    assert_equal([3, 3], Chessboard.change_in_coordinates('d4', 'g1'))
    assert_equal([0, 0], Chessboard.change_in_coordinates('d4', 'd4'))
  end

  def test_that_it_can_convert_itself_to_string
    empty_board_string =<<EOS
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
EOS
    board = Chessboard.new
    assert_equal(empty_board_string.chomp, board.to_s, "Empty Board")

    board.add(Rook.new(:black), 'a8')
    board.add(Knight.new(:black), 'b8')
    board.add(Bishop.new(:black), 'c8')
    board.add(Queen.new(:black), 'd8')
    board.add(King.new(:black), 'e8')
    board.add(Bishop.new(:black), 'f8')
    board.add(Knight.new(:black), 'g8')
    board.add(Rook.new(:black), 'h8')

    board.add(Pawn.new(:black), 'a7')
    board.add(Pawn.new(:black), 'b7')
    board.add(Pawn.new(:black), 'c7')
    board.add(Pawn.new(:black), 'd7')
    board.add(Pawn.new(:black), 'e7')
    board.add(Pawn.new(:black), 'f7')
    board.add(Pawn.new(:black), 'g7')
    board.add(Pawn.new(:black), 'h7')

    board.add(Pawn.new(:white), 'a2')
    board.add(Pawn.new(:white), 'b2')
    board.add(Pawn.new(:white), 'c2')
    board.add(Pawn.new(:white), 'd2')
    board.add(Pawn.new(:white), 'e2')
    board.add(Pawn.new(:white), 'f2')
    board.add(Pawn.new(:white), 'g2')
    board.add(Pawn.new(:white), 'h2')

    board.add(Rook.new(:white), 'a1')
    board.add(Knight.new(:white), 'b1')
    board.add(Bishop.new(:white), 'c1')
    board.add(Queen.new(:white), 'd1')
    board.add(King.new(:white), 'e1')
    board.add(Bishop.new(:white), 'f1')
    board.add(Knight.new(:white), 'g1')
    board.add(Rook.new(:white), 'h1')

    standard_board_string =<<EOS
bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR
EOS
    assert_equal(standard_board_string.chomp, board.to_s, "Standard Board")
  end

  def test_that_it_can_load_itself_from_file
    filepath = Pathname.new("resources").join('simple_board.txt')
    loaded_text = File.readlines(filepath).join('')

    board = Chessboard.new
    board.load(filepath)

    assert_equal(loaded_text.chomp, board.to_s, "Board loaded from file")
  end

end

require 'minitest_helper'

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
    assert_equal(['a1', 'b1', 'c1', 'd1'], Chessboard.make_path('a1', 'd1'), 'Path from a1 to d1')
    assert_equal(['d1', 'c1', 'b1', 'a1'], Chessboard.make_path('d1', 'a1'), 'Path from d1 to a1')
    assert_equal(['c1', 'd2', 'e3', 'f4'], Chessboard.make_path('c1', 'f4'), 'Path from c1 go f4')
    assert_equal(['f4', 'e3', 'd2', 'c1'], Chessboard.make_path('f4', 'c1'), 'Path from f4 to c1')
    assert_equal(['f4', 'f3', 'f2', 'f1'], Chessboard.make_path('f4', 'f1'), 'Path from f4 to f1')
    assert_equal(['b1', 'b2', 'b3', 'b4'], Chessboard.make_path('b1', 'b4'), 'Path from b1 to b4')
    assert_raises(ArgumentError) {Chessboard.make_path('a1', 'd2')}
  end

  def test_that_it_can_detect_impediments
    board = Chessboard.new
    board.add(Chesspiece.create('wP'), 'c2')
    board.add(Chesspiece.create('wR'), 'e2')

    refute(board.impediments?('c2', 'd2'))
    refute(board.impediments?('c2', 'e2'))
    assert(board.impediments?('c2', 'f2'))
  end

  def test_that_it_knows_distance_between_coordinates
    assert_equal(1, Chessboard.distance_between('b1', 'b2'))
    assert_equal(1, Chessboard.distance_between('b1', 'c2'))
    assert_equal(1, Chessboard.distance_between('b1', 'c1'))

    assert_equal(3, Chessboard.distance_between('b1', 'b4'))
    assert_equal(3, Chessboard.distance_between('b1', 'e4'))
    assert_equal(3, Chessboard.distance_between('b1', 'e1'))
  end

end

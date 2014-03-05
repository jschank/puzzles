require 'minitest_helper'

# test chessboard functionality
class TestPawn < MiniTest::Test

  def setup
  end

  def test_that_it_can_display_itself
    piece = Chesspiece.create('bP')
    assert_equal('bP', piece.to_s)

    piece = Chesspiece.create('wP')
    assert_equal('wP', piece.to_s)
  end

  def test_pawns_know_their_home_row
    assert(Chesspiece.create('wP').home?('c2'), "White home")
    assert(Chesspiece.create('wP').home?('d2'), "White home")
    refute(Chesspiece.create('wP').home?('d7'), "White NOT home")

    assert(Chesspiece.create('bP').home?('c7'), "Black home")
    assert(Chesspiece.create('bP').home?('d7'), "Black home")
    refute(Chesspiece.create('bP').home?('d2'), "Black NOT home")
  end

  def test_white_moves_from_home_row
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'c2')

    assert(piece.valid_move?('c2', 'c3', board), "White PAWN can move forward 1 space from home position")
    assert(piece.valid_move?('c2', 'c4', board), "White PAWN can move forward 2 spaces from home position")
    refute(piece.valid_move?('c2', 'c1', board), "White PAWN can not move backward")
  end

  def test_pawns_know_forward_movement_for_their_color
    assert(Chesspiece.create('wP').forward?('c2', 'c3'), "White forward move")
    assert(Chesspiece.create('wP').forward?('c2', 'd3'), "White forward capture")
    assert(Chesspiece.create('wP').forward?('c2', 'b3'), "White forward capture")
    refute(Chesspiece.create('wP').forward?('c3', 'c2'), "White backward move")
    refute(Chesspiece.create('wP').forward?('d3', 'c2'), "White backward capture")
    refute(Chesspiece.create('wP').forward?('b3', 'c2'), "White backward capture")

    refute(Chesspiece.create('bP').forward?('c2', 'c3'), "black backward move")
    refute(Chesspiece.create('bP').forward?('c2', 'd3'), "black backward capture")
    refute(Chesspiece.create('bP').forward?('c2', 'b3'), "black backward capture")
    assert(Chesspiece.create('bP').forward?('c3', 'c2'), "black forward move")
    assert(Chesspiece.create('bP').forward?('d3', 'c2'), "black forward capture")
    assert(Chesspiece.create('bP').forward?('b3', 'c2'), "black forward capture")
  end

  def test_white_moves_from_other_row
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'g4')

    refute(piece.valid_move?('g4', 'g6', board), "White PAWN can not move forward more than one space if not on home row")
  end

  def test_white_captures
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'd4')

    board.add(Chesspiece.create('bP'), 'e5')
    board.add(Chesspiece.create('bP'), 'c5')
    board.add(Chesspiece.create('bP'), 'c3')
    board.add(Chesspiece.create('bP'), 'e3')

    assert(piece.valid_move?('d4', 'e5', board), "White PAWN can capture on diagonal")
    assert(piece.valid_move?('d4', 'c5', board), "White PAWN can capture on diagonal")
    refute(piece.valid_move?('d4', 'e3', board), "White PAWN cannot capture on diagonal, backwards")
    refute(piece.valid_move?('d4', 'c3', board), "White PAWN cannot capture on diagonal, backwards")
  end

  def test_white_blocked
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'f2')

    board.add(Chesspiece.create('bP'), 'f3')

    refute(piece.valid_move?('f2', 'f3', board), "White PAWN blocked by black piece")
    refute(piece.valid_move?('f2', 'f4', board), "White PAWN blocked by black piece")
  end

  def test_black_moves_from_home_row
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'c7')

    assert(piece.valid_move?('c7', 'c6', board), "Black PAWN can move forward 1 space from home position")
    assert(piece.valid_move?('c7', 'c5', board), "Black PAWN can move forward 2 spaces from home position")
    refute(piece.valid_move?('c7', 'c8', board), "Black PAWN can not move backward")
  end

  def test_black_moves_from_other_row
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'c4')

    refute(piece.valid_move?('c4', 'c2', board), "Black PAWN can not move forward more than one space if not on home row")
  end

  def test_black_captures
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'd5')

    board.add(Chesspiece.create('wP'), 'e4')
    board.add(Chesspiece.create('wP'), 'c4')
    board.add(Chesspiece.create('wP'), 'e6')
    board.add(Chesspiece.create('wP'), 'c6')

    assert(piece.valid_move?('d5', 'e4', board), "Black PAWN can capture on diagonal")
    assert(piece.valid_move?('d5', 'c4', board), "Black PAWN can capture on diagonal")
    refute(piece.valid_move?('d5', 'e6', board), "Black PAWN cannot capture on diagonal, backwards")
    refute(piece.valid_move?('d5', 'c6', board), "Black PAWN cannot capture on diagonal, backwards")
  end

  def test_white_blocked
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'f2')

    board.add(Chesspiece.create('bP'), 'f3')

    refute(piece.valid_move?('f2', 'f3', board), "White PAWN blocked by black piece")
    refute(piece.valid_move?('f2', 'f4', board), "White PAWN blocked by black piece")
  end

  def test_black_blocked
    board = Chessboard.new
    piece = Chesspiece.create('bP')
    board.add(piece, 'f7')

    board.add(Chesspiece.create('wP'), 'f6')

    refute(piece.valid_move?('f7', 'f7', board), "Black PAWN blocked by black piece")
    refute(piece.valid_move?('f7', 'f5', board), "Black PAWN blocked by black piece")
  end

  def test_exposed_check_moves
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'f2')

    board.add(Chesspiece.create('wK'), 'e1')
    board.add(Chesspiece.create('bB'), 'g3')

    refute(piece.valid_move?('f2', 'f3', board), "White PAWN move would expose king to check")
  end

  def test_exposed_check_capture
    board = Chessboard.new
    piece = Chesspiece.create('wP')
    board.add(piece, 'e2')

    board.add(Chesspiece.create('wK'), 'e1')
    board.add(Chesspiece.create('bP'), 'f3')
    board.add(Chesspiece.create('bR'), 'e4')

    refute(piece.valid_move?('f2', 'f3', board), "White PAWN capture would expose king to check")
  end

end

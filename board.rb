require_relative "piece"
require_relative 'print'
require 'pry'

class Board
  # WHITE_BLACK = {white: '⚪', black: '⚫' }
  include Print
  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    initial_board
  end

  def [](pos)
    i,j = pos
    board[i][j]
  end

  def []=(pos, value)
    i, j = pos
    board[i][j] = value
  end


  def initial_board
    (0..7).each do |i|
      @board[0][i] = Piece.new(board: board, color: :white, pos: [0,i], king: false ) if i.even?
      @board[2][i] = Piece.new(board: board, color: :white, pos: [2,i], king: false ) if i.even?
      @board[6][i] = Piece.new(board: board, color: :black, pos: [6,i], king: false ) if i.even?
    end
    (1..7).each do |i|
      @board[1][i] = Piece.new(board: board, color: :white, pos: [1,i], king: false ) if i.odd?
      @board[5][i] = Piece.new(board: board, color: :black, pos: [5,i], king: false ) if i.odd?
      @board[7][i] = Piece.new(board: board, color: :black, pos: [7,i], king: false ) if i.odd?

    end
  end

  def make_leagal_move(from, to)
    # move_piece_in_square(from, to)
    if valid_move?(to)
      # binding.pry
      self[from].move(self,to)
      self[from], self[to] = nil, self[from]
    end
  end

  def valid_move?(to)
    to[0].between?(0,7) && to[1].between?(0,7)
  end



end

#
# board = Board.new
# board.initial_board
# board.display_board

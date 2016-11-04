require_relative "piece"
require 'pry'

class Board
  WHITE_BLACK = {white: '⚪', black: '⚫' }
  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
  end


  def initial_board
    (0..7).each do |i|
      @board[0][i] = Piece.new(color: :white, pos: [0,i], king: false ) if i.even?
      @board[2][i] = Piece.new(color: :white, pos: [1,i], king: false ) if i.even?
      @board[6][i] = Piece.new(color: :black, pos: [2,i], king: false ) if i.even?
    end
    (1..7).each do |i|
      @board[1][i] = Piece.new(color: :white, pos: [5,i], king: false ) if i.odd?
      @board[5][i] = Piece.new(color: :black, pos: [6,i], king: false ) if i.odd?
      @board[7][i] = Piece.new(color: :black, pos: [7,i], king: false ) if i.odd?

    end
  end

  def display_board
    board.each_with_index do |row, idx|
      print "\n"
      print ((idx - 8).abs).to_s + " "
      str_idx = 0
      row.each_with_index do |square, i|
        if square
          if i.zero? && row[i].is_a?(Piece)
            print WHITE_BLACK[square.color] + '  '
          else
            print ' ' + WHITE_BLACK[square.color] + ' '
          end
        end
        # print ' ' + WHITE_BLACK[square.color] + ' ' if square
        if square.nil?
          if str_idx.zero?
            print '=='
            str_idx = 1
          else
            print ' =='
          end
        end
        # print " "
      end
    end
    print "\n"
    print_letters
    print "\n\n"
    nil
  end

  def print_letters
    ('a'..'h').each do |letter|
      print "  #{letter}"
    end
  end

end


board = Board.new
board.initial_board
board.display_board

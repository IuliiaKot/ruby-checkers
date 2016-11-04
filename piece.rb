class Piece
  attr_reader :color
  attr_accessor :pos
  def initialize(argv={})
    # @board = argv[:board]
    @color = argv[:color]
    @pos = argv[:pos]
    @king = argv[:king]
  end

  def perfome_slide(to_pos)
    pos_x, pos_y = to_pos[0],to_pos[1]
    return false unless legal_move?(to_pos)
    return false unless check_next_square?(to_pos)
  end

  def legal_move?(to_pos)
    board.valid_move?(to_pos)
  end

  def is_next?(to_pos)

    # check if to_pos coordinates is the next square
    (self.pos[0] - to_pos[0]).abs == 1 && (self.pos[1] - to_pos[1]).abs == 1
  end

  def check_next_square?(board,to_pos)
    # binding.pry
    if is_next?(to_pos)
      return board[to_pos] ? false : true
    else
      return false
    end
  end

  def move(board, to)
    # binding.pry
    if check_next_square?(board, to)
      pos = to
    else
      raise "Invalid move"
    end
  end
end

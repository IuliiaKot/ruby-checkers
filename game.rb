require_relative 'board'
class Game
  LATTER_HASH = {
   "a" => 0,
   "b" => 1,
   "c" => 2,
   "d" => 3,
   "e" => 4,
   "f" => 5,
   "g" => 6,
   "h" => 7,

   "1" => 7,
   "2" => 6,
   "3" => 5,
   "4" => 4,
   "5" => 3,
   "6" => 2,
   "7" => 1,
   "8" => 0
 }

  def initialize
    @board = Board.new
  end

  def play
    @board.display_board
    get_input
  end

  def get_input
    moved = false
    until moved
      puts "You turn to move"
      from, to = get_and_clean_input
      p "#{from}, #{to}"
      moved = @board.make_leagal_move(from, to)
      @board.display_board
    end
  end

  def get_and_clean_input
    puts "Enter a move ..."
    from_position, to_position = gets.chomp.split(',')
    # binding.pry
    from_col = LATTER_HASH[from_position.split(':').first]
    from_row = LATTER_HASH[from_position.split(":").last]
    to_col = LATTER_HASH[to_position.split(':').first]
    to_row = LATTER_HASH[to_position.split(":").last]
    [[from_row,from_col],[to_row, to_col]]
  end
end


game = Game.new
game.play

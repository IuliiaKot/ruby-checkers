module Print
  WHITE_BLACK = {white: '⚪', black: '⚫' }
  def display_board
    print_letters
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

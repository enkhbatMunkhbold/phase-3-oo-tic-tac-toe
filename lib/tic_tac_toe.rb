require "pry"

class TicTacToe

  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board
  end

  def display_board 
    new_board = board.each_slice(3).to_a
    new_board.each.with_index do |arr, index|
      if index != 2
        puts printing_level(arr).join('')
        puts "-----------"
      else
        puts printing_level(arr).join('')
      end
    end
  end

  def printing_level list
    list.map.with_index do |item, i|
      if i == 1
        "| #{item} |"
      else
        " #{item} "
      end
    end
  end
end

# binding.pry

# game = TicTacToe.new()
# board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
# game.display_board(board)
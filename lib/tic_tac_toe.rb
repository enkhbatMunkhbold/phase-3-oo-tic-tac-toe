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

  def input_to_index index
    index.to_i - 1 
  end

  def move (index, token = "X")
    board[index] = token
  end

  def position_taken? index
    board[index] != " "
  end

  def valid_move? index
    index >= 0 && index <= 9 && !position_taken?(index)
  end

  def turn_count
    board.select { |token| token != " "}.length
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    print 'Select a square: '
    input = input_to_index(gets.chomp)
    token = current_player
    if valid_move?(input)
      move(input, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.select do |x|
      comb = x.map {|ind| board[ind]}
      comb == ["X", "X", "X"] || comb == ["O", "O", "O"]
    end
  end

end

# binding.pry

# game = TicTacToe.new()
# board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
# game.display_board(board)
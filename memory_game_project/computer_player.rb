require_relative "./board.rb"
require_relative "./card.rb"

require "byebug"

class ComputerPlayer
  attr_accessor :score

  def initialize
    @score = 0
  end

  def make_move(board)
    row = (0...(board.grid.length)).to_a.sample
    col = (0...(board.grid.length)).to_a.sample
    pos = [row, col]
    if board[pos].hidden == false
      make_move(board)
    else
      board.reveal(pos)
    end
  end

end

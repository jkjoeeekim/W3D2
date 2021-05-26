# move all of your user input logic into the player class
# require_relative "./game.rb"
require_relative "./board.rb"
require_relative "./card.rb"

class HumanPlayer
  attr_accessor :score, :name

  def initialize(name)
    @name = name
    @score = 0
  end

  def get_size
    begin
        #m debugger
        puts "\nEnter board size\n "
        size = gets.chomp.to_i
        raise StandardError.new("Board size must be even") if size.odd?
        raise StandardError.new("Board must be at least 2") if size < 2
        size
    rescue => error
        p error.message
        retry
    end
  end

  def get_pos(board)
    begin
        puts "\nEnter a row\n "
        # debugger

        row = gets.chomp.to_i
        raise StandardError.new("Row does not exist") if row >= board.grid.length
        raise StandardError.new("Input must be a number") unless (0..9).include?(row)
        puts "\nEnter a column\n "
        # debugger
        col = gets.chomp.to_i
        # debugger
        raise StandardError.new("Column does not exist") if col >= board.grid.length
        raise StandardError.new("Input must be a number") unless (0..9).include?(col)
        [row, col]
    rescue => error
        p error.message
        retry
    end
  end

  def make_guess(board)
      begin
        # debugger
        pos = get_pos(board)
        if board[pos].hidden == false # if card == previous_card
          raise StandardError.new("You already checked this card")
        else
          board.reveal(pos)
        end
      rescue => error
        p error.message
        retry
      end
  end
end

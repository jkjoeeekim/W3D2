require_relative "./board.rb"
require_relative "./card.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

require "byebug"



class Game
    attr_reader :player, :computer

    def initialize
      @player = HumanPlayer.new("Johny")
      @computer = ComputerPlayer.new
    end

    def play
        begin
          size = @player.get_size
          @board = Board.new(size)
          @board.populate

          until @board.won?
            puts "\n\nCurrent Score\n "
            puts "#{@player.name}'s score: #{@player.score}\nComputer's score: #{@computer.score}\n "
            play_turn
          end
          puts "\n\nFinal Score\n "
          puts "#{@player.name}'s score: #{@player.score}\nComputer's score: #{@computer.score}\n "
        rescue => error
          p error.message
          retry
        end
    end

    def play_turn
        begin
            @board.render

            card1 = @player.make_guess(@board)
            @board.render
            card2 = @player.make_guess(@board)
            @board.render

            sleep(2)
            system("clear")

            if card1 == card2
              @player.score += 1
            else
              card1.hide
              card2.hide
            end

            return if @board.won?

            puts "Its the computer's turn to move\n Press Enter to continue"
            gets
            card1 = @computer.make_move(@board)
            card2 = @computer.make_move(@board)
            @board.render
            sleep(2)
            system("clear")

            if card1 == card2
              @computer.score += 1
            else
              card1.hide
              card2.hide
            end
        rescue
            retry
        end
    end
end

g = Game.new
g.play

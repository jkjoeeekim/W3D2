require_relative './card.rb'

class Board
  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size){ Array.new(size) }
    @size = size * size
  end

  def populate
    chars = ('A'..'Z').to_a
    pairs = []

    (@size / 2).times do
        char = chars.sample
        chars.delete(char)
        pairs += [Card.new(char), Card.new(char)]
    end

    pairs.shuffle!

    @grid.map! do |row|
        row.map! do |ele|
            pairs.shift
        end
    end
  end

  def render
    grid.each do |row|
      print "#{' '*5}| "
      row.each { |card| print "#{card.display_card} " }
      print "|#{' '*5}\n"
      puts
    end
  end

  def won?
    grid.all? do |row|
      row.all? { |card| !card.hidden }
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def reveal(guessed_pos)
    # debugger
    card = self[guessed_pos]
    if card.hidden
      card.reveal
      card
    else
      false
    end
  end

end


# b = Board.new(6)
# b.populate
# # b.render
# p b.won?

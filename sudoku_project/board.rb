require_relative './tile'

class Board
  class << self
    def from_file
      random = (1..3).to_a.sample
      File.readlines("puzzles/sudoku#{random}.txt").map(&:chomp)
    end
  end

  attr_reader :grid, :puzzle

  def initialize
    @puzzle = Board.from_file
    @grid = Array.new(@puzzle.length) { Array.new(@puzzle[0].length) }
    fill_grid
  end

  def fill_grid
    grid.each_with_index do |row, idx|
      row.each_with_index do |_ele, idx2|
        ele = puzzle[idx][idx2]
        @grid[idx][idx2] = Tile.new(ele)
      end
    end
  end

  def all_squares
    squares = Hash.new { |hash, key| hash[key] = Array.new(3) { Array.new(3) } }

    number = 0
    9.times do |squares_idx|
      3.times do |row_idx|
        3.times do |col_idx|
          squares[squares_idx][row_idx][col_idx] = number
          number += 1
        end
      end
    end

    # squares_idx = 1
    # row_idx = 0
    # col_idx = 0
    # until squares_idx > 9
    #   grid.each_with_index do |row, idx1|
    #     row.each_with_index do |ele, idx2|
    #       if idx < 3

    #       end
    #     end
    #   end
    # end

    squares
  end

  def print_grid
    grid.each_with_index do |row, idx1|
      break_points = [2, 5]
      row.each_with_index do |ele, idx2|
        print " #{ele.value} "
        print '|' if break_points.include?(idx2)
      end
      puts "\n"
      puts ('-' * 29).to_s if break_points.include?(idx1)
    end
  end
end

board = Board.new
# p board.grid
# p board.puzzle
board.print_grid
p board.all_squares

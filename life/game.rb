require_relative './cell.rb'

class Game

  def initialize
    @matrix_size = 5
    @matrix = Array.new(@matrix_size) { Array.new(@matrix_size) }
    fill_matrix # Llenar mi matriz ._.)/
    @cells = Cell.new(@matrix, @matrix_size)
  end

  def fill_matrix
    for row in 0...@matrix_size
      for col in 0...@matrix_size
        @matrix[col][row] = 0
      end
    end
  end

  def show_board
    @matrix.each do |row|
      print row.to_s
      print "\n"
    end
  end

  def start_game
    show_board
    @cells.set_livings_cell
    print "\n"
    show_board
    print "\n" 
    (0..5).each do |i| # interaciones ._.)
      @cells.find_cells
      show_board
      print "\n"
    end
  end
end

game = Game.new
game.start_game
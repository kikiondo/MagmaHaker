# require_relative './game.rb'

# Class for creating cells and control their lifes
class Cell
  def initialize(game, game_size)
    @number_cells = 20
    @board = game
    @board_size = game_size
  end

  # Pruebas de mi programa, asignando desde un principio celulas vivas.
  def set_livings_cell
    @board[2][2] = 1
    @board[2][3] = 1
    @board[3][3] = 1
    @board[3][4] = 1
    @board[4][4] = 1
  end

  def find_cells
    for col in 0..@board_size - 1
      for row in 0..@board_size - 1
        @current = @board[col][row]
        @neighbors = check_neighbors(@board, col, row)
        if @current.zero? && @neighbors == 3
          @board[col][row] = 1
        elsif @current == 1 && (@neighbors < 2 || @neighbors > 3)
          @board[col][row] = 0
        else
          @board[col][row] = @current
        end
      end
    end
  end

  def check_neighbors(matrix, col, row)
    sum = 0
    for x in -1..1
      for y in -1..1
        positionX = (col + x)
        positionY = (row + y)
        if positionX >= 0 && positionY >= 0
          if positionX <= @board_size - 1 && positionY <= @board_size - 1
            sum += matrix[positionX][positionY]
          end
        end
      end
    end
    sum -= matrix[col][row]
    sum
  end
end
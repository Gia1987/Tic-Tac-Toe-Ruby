# Class manage to draw the board in the console by reciving the game_state
class Board
  attr_reader :grid

  def initialize
    @grid = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
  # draw the board based on the state of the game received
  def draw_board
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts '-----------'
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts '-----------'
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
  end

  def update_grid(move, current_player)
    if @grid[move] == ' '
      @grid[move] = current_player
    else
      puts 'Please chose another cell'
    end
  end

  def available_indexes
    @grid.each_index.select { |i| @grid[i] == ' ' }
  end

  def reset_grid
    @grid = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end

# Class manage to draw the board in the console by reciving the game_state
class Board
  attr_reader :grid

  def initialize(grid = Array.new(9, ' '))
    @grid = grid
  end

  def winning_combinations
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  # draw the board based on the state of the game received
  def draw_board
    puts ''
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts '-----------'
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts '-----------'
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
  end

  def update_grid(move, current_player)
    @grid[move] = current_player.mark if @grid[move] == ' '
  end

  def reset_tile(index)
    @grid[index] = ' '
  end

  def available_indexes
    @grid.each_index.select { |i| @grid[i] == ' ' }
  end

  def full?
    available_indexes.empty?
  end

  def reset_grid
    @grid = Array.new(9, ' ')
  end
end

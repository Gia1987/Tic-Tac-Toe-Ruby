require_relative './human'
require_relative './board'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :count, :over, :players

  def initialize(human = Human.new, board = Board.new)
    # state of the game
    @human = human
    @board = board
    @players = ['O', 'X']
    @count = -1
  end

  def winning_combinations
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  def current_player
    @players.first
  end

  def change_player
    @count += 1
    @players.rotate!
  end

  def won?(player = current_player)
    winning_combinations.any? { |combo| combo.all? { |index| @board.grid[index] == player} }
  end

  def draw?
    !won?(current_player) && !won?(@players.last) && count == 8
  end
end

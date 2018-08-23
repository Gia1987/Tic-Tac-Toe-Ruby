require_relative './human'
require_relative './board'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :count, :over, :players, :game_over

  def initialize(human = Human.new, board = Board.new)
    # state of the game
    @human = human
    @board = board
    @players = ['O', 'X']
    @count = -1
    @game_over = false
  end

  def winning_combinations
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  def play
    until game_over
      if over?
        @board.draw_board
        @game_over = true
        return no_wins if draw?
        return congrats if won?(current_player) || won?(@players.last)
      else
        @board.draw_board
        change_player
        move = @human.move
        @board.update_grid(move, current_player)
      end
    end
  end

  def current_player
    @players.first
  end

  def change_player
    @count += 1
    @players.rotate!
  end

  def won?(player = current_player)
    # should check if any combination has neen matched during the game.
    winning_combinations.any? { |combo| combo.all? { |index| @board.grid[index] == player} }
  end

  def draw?
    !won?(current_player) && !won?(@players.last) && count == 8
  end

  def congrats
    puts "Congratulations #{current_player}"
  end

  def no_wins
    puts 'Its a Draw!'
  end

  def over?
    # should check if the game either won or draw.
    won?(current_player) || won?(@players.last) || draw?
  end
end

require_relative './human'
require_relative './board'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :state, :current_player

  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # state of the game
    @current_player = 'X'
  end

  def change_player
    return @current_player = 'O' if @current_player == 'X'
    @current_player = 'X'
  end

  def play(input)
    @state[input] = @current_player
  end
end

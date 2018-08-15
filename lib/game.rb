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

  def horizontal
    true if
      @state[0] == @current_player && @state[1] == @current_player && @state[2] == @current_player ||
      @state[3] == @current_player && @state[4] == @current_player && @state[5] == @current_player ||
      @state[6] == @current_player && @state[7] == @current_player && @state[8] == @current_player
  end

  def vertical
    true if
      @state[0] == @current_player && @state[3] == @current_player && @state[6] == @current_player ||
      @state[1] == @current_player && @state[4] == @current_player && @state[7] == @current_player ||
      @state[2] == @current_player && @state[5] == @current_player && @state[8] == @current_player
  end

  def diagonal
    true if
      @state[0] == @current_player && @state[4] == @current_player && @state[8] == @current_player ||
      @state[2] == @current_player && @state[4] == @current_player && @state[6] == @current_player
  end

  def won?
    true if horizontal == true || vertical == true || diagonal == true
  end

end

require_relative './human'
require_relative './board'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :state

  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # state of the game
  end
end

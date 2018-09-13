require_relative './human'
require_relative './board'
require_relative './Ai'
require_relative './messages'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :over, :players

  def initialize(human_class = Human, board_class = Board, computer_class = AI, messages_class = Messages)
    @computer_class = computer_class
    @human_class = human_class
    @board = board_class.new
    @messages = messages_class.new
    @players = []
  end

  def menu
    @messages.welcome
    input = gets.to_i
    case input
    when 1 then @players = [@human_class.new('X'), @human_class.new('O')]
    when 2 then @players = [@computer_class.new('X'), @computer_class.new('O')]
    when 3 then @players = [@human_class.new('X'), @computer_class.new('O')]
    end
    start
    play_again?
  end

  def play_again?
    @messages.play_again
    again = gets.chomp
    again == 'y' ? reset_game : exit
  end

  def move_is_valid?(move)
    @board.available_indexes.include? move
  end

  def take_turn
    @board.draw_board
    @messages.prompt_player(current_player)
    move = current_player.move(@board)
    if move_is_valid?(move)
      @board.update_grid(move, current_player)
      change_player
    else
      @messages.choose_again
      take_turn
    end
  end

  def start
    take_turn until game_over?
    result
  end

  def result
    change_player
    @board.draw_board
    @messages.no_wins if draw?
    @messages.congrats(current_player) if won?
  end

  def reset_game
    @board.reset_grid
    menu
  end

  def current_player
    @players.first
  end

  def change_player
    @players.rotate!
  end
  # should check if any combination has neen matched during the game.
  def won_by?(player)
    @board.winning_combinations.any? { |combo| combo.all? { |index| @board.grid[index] == player.mark} }
  end

  def won?
    won_by?(@players.first) || won_by?(@players.last)
  end

  def draw?
    !won? && @board.full?
  end

  # should check if the game either won or draw.
  def game_over?
    won? || draw?
  end
end

Game.new.menu

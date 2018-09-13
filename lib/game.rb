require_relative './human'
require_relative './board'
require_relative './Ai'

# Game class manage all of the logic and state of the game.
class Game
  attr_reader :over, :players

  def initialize(human_class = Human, board_class = Board, computer_class = AI)
    @computer_class = computer_class
    @human_class = human_class
    @board = board_class.new
    @players = []
  end

  def winning_combinations
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  def welcome
    puts 'Welcome to Tic Tac Toe. Please chose the game mode:'
    puts 'press 1 for human VS human'
    puts 'press 2 for computer VS computer'
    puts 'press 3 for human VS computer'
  end

  def menu
    welcome
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
    puts 'play again? y/n'
    again = gets.chomp
    again == 'y' ? reset_game : exit
  end

  def take_turn
    @board.draw_board
    move = current_player.move(@board)
    change_player if @board.update_grid(move, current_player.mark)
  end

  def start
    take_turn until game_over?
    result
  end

  def result
    @players.rotate!
    @board.draw_board
    return no_wins if draw?
    return congrats if won?
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
    puts "Player #{current_player.mark} is your turn."
  end
  # should check if any combination has neen matched during the game.
  def won_by?(player)
    winning_combinations.any? { |combo| combo.all? { |index| @board.grid[index] == player.mark} }
  end

  def won?
    won_by?(@players.first) || won_by?(@players.last)
  end

  def draw?
    !won? && @board.full?
  end

  def congrats
    puts "Congratulations #{current_player.mark}"
  end

  def no_wins
    puts 'Its a Draw!'
  end
  # should check if the game either won or draw.
  def game_over?
    won? || draw?
  end
end

Game.new.menu

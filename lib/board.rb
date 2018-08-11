# Class manage to draw the board in the console by reciving the game_state
class Board
  def draw_board(game_state)
    puts " #{game_state[0]} | #{game_state[1]} | #{game_state[2]} "
    puts '-----------'
    puts " #{game_state[3]} | #{game_state[4]} | #{game_state[5]} "
    puts '-----------'
    puts " #{game_state[6]} | #{game_state[7]} | #{game_state[8]} "
  end
end

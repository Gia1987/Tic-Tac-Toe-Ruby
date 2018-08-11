require 'spec_helper'
require'./lib/board'

describe Board do
  subject(:board) { Board.new() }

  context '#draw_board' do
    it' returns array of nine elements' do
      game_state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect{board.draw_board(game_state)}
      .to output( "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
      .to_stdout
    end
  end
end

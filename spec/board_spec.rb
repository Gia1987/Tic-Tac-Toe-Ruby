require 'spec_helper'
require'./lib/board'

describe Board do
  subject(:board) { Board.new() }

  context '#draw_board' do
    it' returns array of nine elements' do
      grid = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect{board.draw_board(grid)}
      .to output( "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n")
      .to_stdout
    end
  end
end

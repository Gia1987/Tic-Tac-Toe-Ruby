require 'spec_helper'
require'./lib/board'

describe Board do
  subject(:board) { Board.new }
  context '#grid' do
    it 'is a array of nine elements as a state of the game' do
      expect(board.grid).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  context '#draw_board' do
    it' display the board as output' do
      expect { board.draw_board }
      .to output("   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n").to_stdout
    end
  end
  context '#update_grid' do
    it 'exchange array element with current_players mark' do
      board.update_grid(0, 'X')
      expect(board.grid).to eq(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
    it 'print a string as output if try to overwrite an element' do
      board.update_grid(0, 'X')
      board.update_grid(1, 'O')
      board.update_grid(0, 'X')
      expect { board.update_grid(0, 'X') }.to output("Please chose another cell\n").to_stdout
    end
  end
end

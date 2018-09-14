require 'spec_helper'
require'./lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:full_grid) { ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X ', 'O'] }
  let(:full_board) { Board.new(full_grid) }
  let(:player1) { double(:player1, mark: 'X') }
  let(:player2) { double(:player2, mark: 'O') }

  context '#grid' do
    it 'is a array of nine elements as a state of the game' do
      expect(board.grid).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  context '#draw_board' do
    it' display the board as output' do
      expect { board.draw_board }
      .to output("\n   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n").to_stdout
    end
  end

  context '#update_grid' do
    it 'exchange array element with current_players mark' do
      board.update_grid(0, player1)
      board.update_grid(1, player2)
      expect(board.grid).to eq(['X', 'O', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
    it 'does not overwrite a space already occupied' do
      board.update_grid(0, player1)
      board.update_grid(0, player2)
      expect(board.grid).to eq(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  context '#reset_grid' do
    it 'it refresh the grid as an array of empty strings' do
      board.update_grid(0, player1)
      board.update_grid(1, player2)
      board.update_grid(2, player1)
      board.reset_grid
      expect(board.grid).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  context '#full?' do
    it'Returns true if the grid is full' do
      expect(full_board.full?).to eq(true)
    end
    it'Returns false when the grid is not full' do
      expect(board.full?).to eq(false)
    end
  end

  context '#available_indexes' do
    it'returns an array with available grid indexes' do
      board.update_grid(0, player1)
      board.update_grid(1, player2)
      board.update_grid(2, player1)
      expect(board.available_indexes).to eq([3,4,5,6,7,8])
    end
  end
end

require 'spec_helper'
require './lib/game'

describe Game do
  subject(:game) { Game.new(human, board) }
  let(:human) { double(:move, move: nil) }
  let(:board) { double(:grid, grid: nil) }

  context '#players' do
    it 'is an array with O and X' do
      expect(game.players).to eq(['O', 'X'])
    end
  end
  context '#winning_combinations' do
    it 'is an array with winning combinations' do
      expect(game.winning_combinations).to eq([
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
      ])
    end
  end
  context '#current_player' do
    it 'returns first element of the array players' do
      expect(game.current_player).to eq('O')
    end
  end
  context '#change_player' do
    it 'rotates the element of the array players' do
      game.players
      expect(game.change_player).to eq(['X', 'O'])
    end
    it 'increase count attribute' do
      game.change_player
      game.change_player
      expect(game.count).to eq(1)
    end
  end
  context '#won?' do
    it 'returs true if the game is either won' do
      allow(game).to receive(:current_player) { 'X' }
      allow(board).to receive(:grid) {['X', 'X', 'X', ' ', 'O', ' ', 'O', ' ', ' ']}
      expect(game.won?).to eq(true)
    end
  end
  context '#draw?' do
    it 'returns true if nobody won and the grid is full' do
      allow(game).to receive(:won?) { false }
      allow(game).to receive(:count) { 8 }
      expect(game.draw?).to eq(true)
    end
  end
  context '#congrats' do
    it 'should puts a string' do
      expect { game.congrats }.to output("Congratulations O\n").to_stdout
    end
  end
  context '#no_wins' do
    it 'should puts a string' do
      expect { game.no_wins }.to output("Its a Draw!\n").to_stdout
    end
  end
  context '#over?' do
    it 'returs true if the game won' do
      allow(game).to receive(:draw?) { false }
      allow(game).to receive(:won?) { true }
      expect(game.over?).to eq(true)
    end
    it 'returs true if the game draw' do
      allow(game).to receive(:won?) { false }
      allow(game).to receive(:draw?) { true }
      expect(game.over?).to eq(true)
    end
  end
end

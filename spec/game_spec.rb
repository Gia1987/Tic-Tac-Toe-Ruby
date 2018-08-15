require 'spec_helper'
require './lib/game'

describe Game do
  subject(:game) { Game.new }
  context '#game_state' do
    it 'is a array of nine elements as a state of the game' do
      expect(game.state).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end
  context '#change_player' do
    it 'turns current player from X to O' do
      game.change_player
      expect(game.current_player).to eq('O')
    end
    it 'turns current player from O to X' do
      game.change_player
      game.change_player
      expect(game.current_player).to eq('X')
    end
  end
  context '#play' do
    it 'should update the state of the game' do
      game.play(0)
      game.change_player
      game.play(2)
      game.change_player
      game.play(4)
      game.change_player
      game.play(6)
      expect(game.state).to eq(['X', ' ', 'O', ' ', 'X', ' ', 'O', ' ', ' '])
    end
  end
end

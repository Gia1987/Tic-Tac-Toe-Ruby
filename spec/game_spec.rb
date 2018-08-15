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
end

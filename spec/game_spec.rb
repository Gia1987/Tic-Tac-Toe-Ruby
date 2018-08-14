require 'spec_helper'
require './lib/game'

describe Game do
  subject(:game) { Game.new }
  context '#game_state' do
    it 'is a array of nine elements as a state of the game' do
      expect(game.state).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end
end

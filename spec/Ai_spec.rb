require 'spec_helper'
require './lib/Ai'

describe AI do
  subject(:ai) { AI.new('O') }
  let(:available_indexes) { [1, 2, 3] }
  let(:board) { double(:board, available_indexes: available_indexes) }

  context '#is_computer?' do
    it 'returns true' do
      expect(ai.is_computer?).to eq(true)
    end
  end

  context '#move' do
    it 'returns a number from available index' do
      expect(available_indexes.include?(ai.move(board))).to eq true
    end
  end
end

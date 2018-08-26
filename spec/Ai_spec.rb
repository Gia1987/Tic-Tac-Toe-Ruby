require 'spec_helper'
require './lib/Ai'

describe AI do
  subject(:ai) { AI.new }

  context '#random_move' do
    it "returns a number between 0 and 8" do
      allow(ai).to receive(:rand) { 2 }
      expect(ai.random_move).to eq(2)
    end
  end
end

require 'spec_helper'
require './lib/human'

describe Human do
  subject(:human) { Human.new('X') }

  # context 'player can chose the mark' do
  #   it 'change mark attribute' do
  #     allow(human).to receive(:gets) { 'X' }
  #     human.human_mark
  #     expect(human.mark).to eq('X')
  #   end
  # end
  context '#is_computer?' do
    it 'returns false' do
      expect(human.is_computer?).to eq(false)
    end
  end
  context '#move' do
    it 'recives input from player' do
      allow(human).to receive(:gets) { 1 }
      expect(human.move(:game)).to eq(1)
    end
  end
end

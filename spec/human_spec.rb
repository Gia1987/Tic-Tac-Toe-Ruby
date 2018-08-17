require 'spec_helper'
require './lib/human'

describe Human do
  subject(:human) { Human.new }
  context 'player can chose the mark' do
    it 'change mark attribute' do
      allow(human).to receive(:gets) { 'X' }
      human.human_mark
      expect(human.mark).to eq('X')
    end
  end
  context '#move' do
    it 'recives input from player' do
      allow(human).to receive(:gets) { 1 }
      expect(human.move).to eq(1)
    end
  end
end

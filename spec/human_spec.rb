require 'spec_helper'
require './lib/human'

describe Human do
  subject(:human) { Human.new }
  context 'player can inserts the name' do
    it 'change name attribute' do
      allow(human).to receive(:gets) { 'Giacomo' }
      human.human_name
      expect(human.name).to eq('Giacomo')
    end
  end
  context '#move' do
    it 'recives input from player' do
      allow(human).to receive(:gets) { 'x' }
      expect(human.move).to eq('X')
    end
  end
end

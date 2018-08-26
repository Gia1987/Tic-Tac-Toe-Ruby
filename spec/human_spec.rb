require 'spec_helper'
require './lib/human'

describe Human do
  subject(:human) { Human.new }

  context '#move' do
    it 'recives input from player' do
      allow(human).to receive(:gets) { 1 }
      expect(human.move).to eq(1)
      expect { human.move }.to output("Please insert a number between 0-8\n").to_stdout
    end
  end
end

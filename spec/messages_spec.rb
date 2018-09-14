require 'spec_helper'
require './lib/messages'

describe Messages do
  subject(:messages) { Messages.new }
  let(:player1) { double(:player1, mark: 'X', is_computer?: false) }
  let(:player2) { double(:player2, mark: 'O', is_computer?: true) }

  context '#welcome' do
    it 'Allows the user to choose the game mode' do
      expect { messages.welcome }
      .to output("Welcome to Tic Tac Toe. Please chose the game mode:\npress 1 for human VS human\npress 2 for computer VS computer\npress 3 for human VS computer\n").to_stdout
    end
  end

  context '#congrats' do
    it 'Prints a congratulations sentence' do
      expect { messages.congrats(player1) }
      .to output("Congratulations X\n").to_stdout
    end
  end

  context '#no_wins' do
    it 'Prints a draw sentence' do
      expect { messages.no_wins }
      .to output("Its a Draw!\n").to_stdout
    end
  end

  context '#prompt_player' do
    it 'Tells to the player that its own turn' do
      expect { messages.prompt_player(player2) }
      .to output("Player O is your turn.\n").to_stdout
    end
    it 'Tells to the human player to choose a number between 0-8' do
      expect { messages.prompt_player(player1) }
      .to output("Player X is your turn.\nPlease insert a number between 0-8\n").to_stdout
    end
  end

  context '#play_again' do
    it 'Prints a sentece play_again' do
      expect { messages.play_again }
      .to output("play again? y/n\n").to_stdout
    end
  end

  context '#choose_again' do
    it 'Inform the user to choose another cell' do
      expect { messages.choose_again }
      .to output("Please choose another cell\n").to_stdout
    end
  end
end

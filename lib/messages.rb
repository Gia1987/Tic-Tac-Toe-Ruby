# It contains all messages
class Messages
  def welcome
    puts 'Welcome to Tic Tac Toe. Please chose the game mode:'
    puts 'press 1 for human VS human'
    puts 'press 2 for computer VS computer'
    puts 'press 3 for human VS computer'
  end

  def congrats(player)
    puts "Congratulations #{player.mark}"
  end

  def no_wins
    puts 'Its a Draw!'
  end

  def prompt_player(player)
    puts "Player #{player.mark} is your turn."
    puts 'Please insert a number between 0-8' unless player.is_computer?
  end

  def play_again
    puts 'play again? y/n'
  end

  def choose_again
    puts 'Please choose another cell'
  end

end

# manage Human player
class Human
  def human_mark
    gets.chomp.upcase
  end

  def move
    puts 'Please insert a number between 0-8'
    gets.to_i
  end
end

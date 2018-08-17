# manage Human player
class Human
  attr_reader :mark

  def initialize
    @mark = ''
  end

  def human_mark
    puts 'Please chose your mark:'
    @mark = gets.chomp
  end

  def move
    puts 'Please insert a number between 0-8'
    gets.to_i
  end
end

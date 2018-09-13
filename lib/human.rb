# manage Human player
class Human
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  # * means that the method is going to take an argument that Im not gonna use
  def move(*)
    puts 'Please insert a number between 0-8'
    gets.to_i
  end
end

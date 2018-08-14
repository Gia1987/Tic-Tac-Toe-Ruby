# manage Human player
class Human
  attr_reader :name
  def initialize
    @name = ''
  end

  def human_name
    @name = gets.chomp
  end

  def move
    gets.chomp.upcase
  end
end

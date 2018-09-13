# manage Human player
class Human
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def is_computer?
    false
  end

  def move(_game)
    gets.to_i
  end
end

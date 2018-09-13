# AI Class manage computer's player
class AI
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def move(board)
    board.available_indexes.sample
  end
end

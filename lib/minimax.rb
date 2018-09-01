# Minimax algorithm
class MinMax
  def initialize
    @score = []
  end

  def score(current_player)
    current_player == 'X' ? +1 : -1
    0
  end
end

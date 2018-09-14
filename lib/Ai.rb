# AI Class manage computer's player
class AI
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def is_computer?
    true
  end

  def move(game)
    sleep(1)
    negamax(game, 0, {})
  end

private

  def heuristc_value(game)
    game.won? ? -1 : 0
  end

  def negamax(game, depth, scores_hash)
    if game.game_over?
      return heuristc_value(game)
    else
      game.board.available_indexes.each do |index|
        game.board.update_grid(index, game.current_player)
        scores_hash[index] = (-1 * negamax(game, depth + 1, {}))
        game.board.reset_tile(index)
      end
      if depth.zero?
        return scores_hash.sort_by { |_key, value| value }.last.first
      else
        return scores_hash.sort_by { |_key, value| value }.last.last
      end
    end
  end


end

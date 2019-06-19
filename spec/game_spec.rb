require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  describe '#choose_next_player' do
    it 'should return player two after player one has played' do
      board = Board.new
      player_one = Player.new('Ed', 'X')
      player_two = Player.new('Mo', 'O')
      game = Game.new(board, player_one, player_two)
      old = game.current
      game.choose_next_player
      expect(game.current).not_to equal old
    end
  end
end
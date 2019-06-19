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

  describe '#validate_board' do
    it 'should raise exception if board is nil' do
      player_one = Player.new('Ed', 'X')
      player_two = Player.new('Mo', 'O')
      expect{Game.new(nil, player_one, player_two)}.to raise_error(StandardError)
    end
  end

  describe '#validate_players' do
    it 'should raise exception if any of the players is nil' do
      board = Board.new
      player_two = Player.new('Mo', 'O')
      expect{Game.new(board, nil, player_two)}.to raise_error(StandardError)
    end
  end

  describe '#won?' do
    it 'should return true if player makes a winning move' do
      board = Board.new
      player_one = Player.new('Ed', 'X')
      player_two = Player.new('Mo', 'O')
      winning_set = [
        [1, 2, 3], [4, 5, 6], [7, 9, 8],
        [1, 4, 7], [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]
      ].to_set
      won = true
      winning_set.each do |x|
        game = Game.new(board, player_one, player_two)
        x.each do |move|
          board.recieve_choice(move, player_one)
          game.winner_exists = game.won?
        end
        won &= game.winner_exists
      end
      expect(won).to be true
    end

    it 'should return false if the player does not make any winning move' do
      board = Board.new
      player_one = Player.new('Ed', 'X')
      player_two = Player.new('Mo', 'O')
      winning_set = [
        [1, 2, 3], [4, 5, 6], [7, 9, 8],
        [1, 4, 7], [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]
      ].to_set
      all_moves = (1..9).to_a.combination(3).to_set
      non_winning_set = all_moves - winning_set
      won = false
      non_winning_set.each do |x|
        game = Game.new(board, player_one, player_two)
        x.each do |move|
          board.recieve_choice(move, player_one)
          game.winner_exists = game.won?
        end
        won &= game.winner_exists
      end
      expect(won).to be false
    end

  end


end
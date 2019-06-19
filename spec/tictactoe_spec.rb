require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

describe Board do
  describe '#choice_free?' do
    it 'should return true for all positions when new' do
      board = Board.new
      result = true
      (1..9).each {|ele| result &= board.choice_free?(ele)}
      expect(result).to be true
    end

    it 'should return false if position of choice is not free' do
      board = Board.new
      player = Player.new('Ed', 'X')
      board.recieve_choice(2, player)
      expect(board.choice_free?(2)).to be false
    end
  end

end
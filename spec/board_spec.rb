require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  describe '#choice_free? should return' do
    it 'true for all positions when new' do
      board = Board.new
      result = true
      (1..9).each {|ele| result &= board.choice_free?(ele)}
      expect(result).to be true
    end

    it 'false if position of choice is not free' do
      board = Board.new
      player = Player.new('Ed', 'X')
      board.recieve_choice(2, player)
      expect(board.choice_free?(2)).to be false
    end
  end

  describe '#decode_position' do
    it 'should return (1 - 9) for x and y in (0 - 2)' do
      board = Board.new
      output_positions = []
      (0..2).each do |x|
        (0..2).each do |y|
          output_positions << board.decode_position(x, y)
        end
      end
      expect(output_positions).to match_array (1..9).to_a
    end
  end

  describe '#moves_made_by?' do
    it 'should return an empty array when the board is new' do
      board = Board.new
      player = Player.new('Ed', 'X')
      expect(board.moves_made_by?(player)).to be_empty
    end

    it 'should return [1, 2, 7] when player plays 1, 2 and 7' do
      board = Board.new
      player = Player.new('Ed', 'X')
      [1, 2, 7].each {|x| board.recieve_choice(x, player)}
      expect(board.moves_made_by?(player)).to match_array [2, 1, 7]
    end
  end

  describe '#to_s' do
    it 'should not contain X/O when the board is new' do
      board = Board.new
      expect(board.to_s).not_to match /x|o/i
    end

    it 'should contain n symbols when player makes n moves' do
      board = Board.new
      player = Player.new('Ed', 'X')
      [2, 5, 6].each {|ele| board.recieve_choice(ele, player)}
      expect(board.to_s.count(player.symbol)).to eql 3
    end
  end

  xdescribe '#position'
  xdescribe '#recieve_choice'
end

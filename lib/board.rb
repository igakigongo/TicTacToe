# frozen_string_literal: true

require 'set'

# Maintains state about a TicTacToe Game/Board
class Board
  attr_reader :board, :example, :max_moves, :winning_set

  def initialize
    @board = []
    3.times do
      @board << [nil, nil, nil]
    end
    init_example_board
    init_moves_and_set
  end

  def init_example_board
    @example = "-------------\n"
    [0, 3, 6].each do |i|
      @example += "| #{i + 1} | #{i + 2} | #{i + 3} |\n"
      @example += "------------- \n"
    end
  end

  def init_moves_and_set
    @max_moves = 9
    @winning_set = [
      [1, 2, 3], [4, 5, 6], [7, 9, 8],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ].to_set
  end

  def choice_free?(choice)
    x, y = position(choice)
    @board[x][y].nil?
  end

  def decode_position(x_cord, y_cord)
    case x_cord
    when 0
      y_cord + 1
    when 1
      y_cord + 4
    else
      y_cord + 7
    end
  end

  def moves_made_by?(player)
    locations = []
    @board.each_with_index do |x, x_i|
      x.each_with_index do |y, y_i|
        locations << decode_position(x_i, y_i) if player.symbol.equal? y
      end
    end
    locations
  end

  def position(choice)
    if choice < 4
      [0, choice - 1]
    elsif choice < 7
      [1, choice - 4]
    else
      [2, choice - 7]
    end
  end

  def recieve_choice(choice, current_player)
    x, y = position(choice)
    @board[x][y] = current_player.symbol
  end

  def to_s
    s = "-------------\n"
    @board.each do |row|
      first = row.first.nil? ? ' ' : row.first
      second = row[1].nil? ? ' ' : row[1]
      last = row.last.nil? ? ' ' : row.last
      s += "| #{first} | #{second} | #{last} |\n"
      s += "------------- \n"
    end
    s
  end
end

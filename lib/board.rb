# frozen_string_literal: true

# Maintains state about a TicTacToe Game/Board
require "set"

class Board
  attr_reader :board

  @@winning_set = [[1, 2, 3], [4, 5, 6], [7, 9, 8], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].to_set

  def initialize
    @board = []
    3.times do
      @board << [nil, nil, nil]
    end
  end

  class << self
    def winning_set
      @@winning_set
    end
  end

  def to_s
    s = "-------------\n"
    @board.each do |row|
      first = row.first.nil? ? " " : row.first
      second = row[1].nil? ? " " : row[1]
      last = row.last.nil? ? " " : row.last
      s += "| #{first} | #{second} | #{last} | \n"
      s += "------------- \n"
    end
    s
  end

  def recieve_choice(choice, current_player)
    x, y = position(choice)
    @board[x][y] = current_player.symbol
  end

  def choice_free?(choice)
    x, y = position(choice)
    @board[x][y].nil?
  end

  def position(choice)
    if choice < 4
      return 0, choice - 1
    elsif choice < 7
      return 1, choice - 4
    else
      return 2, choice - 7
    end
  end

  def moves_played_by?(player)
    locations = []
    @board.each_with_index do |x, x_index|
      x.each_with_index do |y, y_index|
        locations << position_to_choice(x_index, y_index) if player.symbol.equal? y
      end
    end
    locations
  end

  def position_to_choice(x, y)
    case x
    when 0
      y + 1
    when 1
      y + 4
    else
      y + 7
    end
  end
end

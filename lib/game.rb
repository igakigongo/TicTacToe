# frozen_string_literal: true

require 'set'

# Links board and players to create the game
# Constraints
# - cannot have more than 2 players
class Game
  attr_accessor :winner_exists
  attr_reader :board, :current, :player_one, :player_two

  def initialize(board, player_one, player_two)
    validate_board(board)
    validate_players(player_one, player_two)

    @board = board
    @player_one = player_one
    @player_two = player_two
    @current = @player_one
    @winner_exists = false
  end

  def choose_next_player
    @current = @current == @player_one ? @player_two : @player_one
  end

  def validate_board(board)
    raise 'Tic Tac Toe board should be initialized' if board.nil?
  end

  def validate_players(player_one, player_two)
    raise 'Please enter correct details for player one' if player_one.nil?
    raise 'Please enter correct details for player two' if player_two.nil?
  end

  def won?
    combinations = @board.moves_made_by?(@current).combination(3).to_set
    (combinations & @board.winning_set).any?
  end
end

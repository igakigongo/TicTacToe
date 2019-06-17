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

  def print_status
    if @winner_exists == true
      puts "#{@current.name} has won"
    else
      puts 'The game ended in a draw'
    end
  end

  def read_choice
    puts 'Make a choice between 1 - 9'
    choice = nil
    loop do
      choice = validate_choice
      break if @board.choice_free?(choice)

      puts 'Choice cell is not free'
      puts 'Make another choice between 1 - 9'
    end
    choice.to_i
  end

  def request_play
    (1..@board.max_moves).each do |_|
      @board.recieve_choice(read_choice, @current)
      puts @board.to_s
      if won?
        @winner_exists = true
        break
      end
      choose_next_player
    end
    print_status
  end

  def validate_board(board)
    raise 'Tic Tac Toe board should be initialized' if board.nil?
  end

  def validate_choice
    choice = gets.chomp
    loop do
      break if /^[1-9]{1}$/.match?(choice)

      puts 'Invalid Choice. Enter a number between 1 and 9'
      choice = gets.chomp
    end
    choice.to_i
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

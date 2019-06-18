# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

def print_status(game)
  if game.winner_exists
    puts "#{game.current.name} has won"
  else
    puts 'The game ended in a draw'
  end
end

def read_choice(game)
  puts "Next player is: #{game.current.name} "
  puts 'Make a choice between 1 - 9'
  choice = nil
  loop do
    choice = validate_choice
    break if game.board.choice_free?(choice)

    puts 'Choice cell is not free'
    puts 'Make another choice between 1 - 9'
  end
  choice.to_i
end

def request_play(game)
  (1..game.board.max_moves).each do |_|
    game.board.recieve_choice(read_choice(game), game.current)
    puts game.board.to_s
    if game.won?
      game.winner_exists = true
      break
    end
    game.choose_next_player
  end
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

board = Board.new

puts 'Enter Player One Information'
print 'Name: '
name = gets.chomp.to_s
player_one = Player.new(name, 'X')

puts 'Enter Player Two Information'
print 'Name: '
name = gets.chomp.to_s
player_two = Player.new(name, 'O')

game = Game.new(board, player_one, player_two)

puts 'You can play the game by placing a nought or a '
puts 'cross in the positions listed below'
puts board.example

request_play(game)

print_status(game)

require_relative "../lib/board"
require_relative "../lib/game"
require_relative "../lib/player"

board = Board.new
player_one = Player.new("Moses", "X")
player_two = Player.new("Edward", "O")

game = Game.new(board, player_one, player_two)
game.request_play
require_relative "../lib/board"
require_relative "../lib/game"
require_relative "../lib/player"

# state is manual, will be updated to pick results 
# using the console 
board = Board.new
player_one = Player.new("Moses", "X")
player_two = Player.new("Edward", "O")

game = Game.new(board, player_one, player_two)
game.request_play
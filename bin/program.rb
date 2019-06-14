require_relative "../lib/board"
require_relative "../lib/player"

board = Board.new
board.print

player = Player.new("Jason", "k")

p player
player.play
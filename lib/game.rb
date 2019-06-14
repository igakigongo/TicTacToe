# Links board and players to create the game
# Constraints
# - cannot have more than 2 players
class Game
    attr_reader :board, :player_one, :player_two

    def initialize(board, player_one, player_two)
        if player_one.nil? || player_two.nil?
           raise 'Tic Tac Toe players should be 2'
        end

        if board.nil?
            raise 'Tic Tac Toe board should be initialized'
        end

        @board = board
        @player_one = player_one
        @player_two = player_two
    end
end
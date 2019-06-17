# Links board and players to create the game
# Constraints
# - cannot have more than 2 players
class Game
    attr_reader :board, :player_one, :player_two
    @current_player
    @@max_moves = 9
    @invalid_board_message = 'Tic Tac Toe board should be initialized'
    @invalid_players_message = 'Tic Tac Toe players should be 2'

    def initialize(board, player_one, player_two)
        # if player is_a?Player && !player.nil?
        invalid_players = proc { |a, b| a.nil? || b.nil? }

        raise Exception.new @invalid_board_message if board.nil?
        raise Exception.new @invalid_players_message if invalid_players.call(player_one, player_two)

        @board = board
        @player_one = player_one
        @player_two = player_two
        @current_player = @player_one
    end

    def request_play
        n = 0
        while n < @@max_moves
						puts "Make a choice between 1 - 9"
						choice = gets.chomp.to_i
						if @board.choice_free?(choice)
							@board.recieve_choice(choice, @current_player)
						else
							puts "Choice cell is not free"
						end
						puts @board.to_s
            @current_player = @current_player == @player_one ? @player_two : @player_one
            n += 1
        end
		end

		
		
			
			 
	
end
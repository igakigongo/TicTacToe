# Maintains state about a TicTacToe Game/Board
class Board
    attr_reader :board

    def initialize
        @board = []
        3.times do 
            @board << [nil, nil, nil]
        end
    end

    def print
        puts "-------------"
        @board.each do |row|
            first = row.first.nil? ? " " : row.first
            second = row[1].nil? ? " " : row[1]
            last = row.last.nil? ? " " : row.last
            puts "| #{first} | #{second} | #{last} |"
            puts "-------------"
        end
    end
end

# board = [
#     [1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9]]

# size = n
# max_times_to_play = n**2

# board class
# add_nought_or_cross
# won? - let us know if the game is won


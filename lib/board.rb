# Maintains state about a TicTacToe Game/Board
class Board
    attr_reader :board

    def initialize
        @board = []
        3.times do 
            @board << [nil, nil, nil]
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
        x,y = position(choice)
        @board[x][y] = current_player.symbol
    end

    def choice_free?(choice)
        x,y = position(choice)
        @board[x][y].nil?
    end

    def position(choice)
        if choice < 4
            return 0, choice-1
        elsif choice < 7
            return 1, choice-4
        else
            return 2, choice-7
        end
    end
end


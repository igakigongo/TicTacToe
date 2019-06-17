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
        if choice < 4
            @board[0][choice-1] = current_player.symbol
        elsif choice < 7
            @board[1][choice-4] = current_player.symbol
        else
            @board[2][choice-7] = current_player.symbol
        end
    end

    def choice_free?(choice)
        if choice < 4
            @board[0][choice-1].nil?
        elsif choice < 7
            @board[1][choice-4].nil?
        else
            @board[2][choice-7].nil?
        end
    end
end


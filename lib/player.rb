# frozen_string_literal: true
# player as an entity
class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    # places a nought or cross on a board
    # should determine move before playing
    def play(board = nil)
        puts "I played symbol #{symbol}"
    end
end
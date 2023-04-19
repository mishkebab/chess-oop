require "singleton"
require_relative "board.rb"

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        return false 
    end     

    def valid_moves
        return self.moves
    end 

    def pos=(val)
        @pos = val
    end 

    def symbol
        @symbol = nil 
    end

    def on_board?(pos)
        row, col = pos
        if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
            return false
        end
        true 
    end 

    private 
    def move_into_check?(end_pos)
        return false
    end 
end 

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol, :moves
    def initialize
        @color = nil 
        @symbol = nil
        @moves = []
    end 

    def empty?
        return true 
    end 
end 
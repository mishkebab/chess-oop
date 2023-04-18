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
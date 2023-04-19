require "singleton"

class Piece
    attr_reader :color, :board, :pos, :symbol
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        return symbol.to_s
    end 

    def empty?
        return false 
    end     

    def valid_moves
        poss_moves = self.moves 
        poss_moves.select {|move| !self.move_into_check?(move)}
    end 

    def pos=(val)
        @pos = val
    end 

    def symbol
        @symbol
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
        dup_board = self.board.board_dup(@board)
        dup_board.move_piece(@pos, end_pos, true)
        dup_board.in_check?(@color)
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

    def dup(dup_board)
        return NullPiece.instance
    end 
end 
require_relative "pieces.rb"

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) do
            Array.new(8) {Piece.new}
        end
    end 

    def [](pos)
        return @board[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end 

    def move_piece(start_pos, end_pos)
        if @board[start_pos[0]][start_pos[1]].empty?
            raise "no piece at position"
        end

        row, col = end_pos
        if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
            raise "off the board"
        end 

        row, col = start_pos
        if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
            raise "off the board"
        end 

        @board[end_pos[0]][end_pos[1]] = @board[start_pos[0]][start_pos[1]]
    end 
end 
require_relative "bishop_rook_queen.rb"
require_relative "knightking.rb"
require_relative "pawn.rb"
require_relative "display.rb"

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) do
            Array.new(8)
        end

        #MAKING PAWNS
        (0..7).each do |col|
            @board[1][col] = Pawn.new(:w, self, [1,col])
            @board[6][col] = Pawn.new(:b, self, [6,col])
        end

        #MAKING NULLS
        (2..5).each do |row|
            (0..7).each do |col|
                @board[row][col] = NullPiece.instance
            end
        end

        #MAKING ROOKS
        @board[0][0] = Rook.new(:w, self, [0,0])
        @board[0][7] = Rook.new(:w, self, [0,7])
        @board[7][0] = Rook.new(:b, self, [7,0])
        @board[7][7] = Rook.new(:b, self, [7,7])

        #MAKING BISHOPS
        @board[0][2] = Bishop.new(:w, self, [0,2])
        @board[0][5] = Bishop.new(:w, self, [0,5])
        @board[7][2] = Bishop.new(:b, self, [7,2])
        @board[7][5] = Bishop.new(:b, self, [7,5])

        #MAKING KNIGHTS
        @board[0][1] = Knight.new(:w, self, [0,1])
        @board[0][6] = Knight.new(:w, self, [0,6])
        @board[7][1] = Knight.new(:b, self, [7,1])
        @board[7][6] = Knight.new(:b, self, [7,6])

        #MAKING KINGS
        @board[0][3] = King.new(:w, self, [0,3])
        @board[7][4] = King.new(:b, self, [7,4])

        #MAKING QUEENS
        @board[0][4] = Queen.new(:w, self, [0,4])
        @board[7][3] = Queen.new(:b, self, [7,3])


    end 

    def [](pos)
        return @board[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end 

    def move_piece(start_pos, end_pos) 
        if !self[start_pos].moves.include?(end_pos)
            raise "not a valid move"
        end 

        self[end_pos] = self[start_pos] 

        self[end_pos].pos = end_pos 

        self[start_pos] = NullPiece.instance

        # if @board[start_pos[0]][start_pos[1]].empty?
        #     raise "no piece at position"
        # end

        # row, col = end_pos
        # if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
        #     raise "off the board"
        # end 

        # row, col = start_pos
        # if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
        #     raise "off the board"
        # end 

    end 

    def on_board?(pos)
        row, col = pos
        if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
            return false
        end
        true 
    end 
end 



class King < Piece
    include Stepable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♚ 
        else 
            @symbol = :♔
        end 
    end 
    def move_diffs
        return [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
    end 

    def dup(dup_board)
        return King.new(@color, dup_board, @pos)
    end 
end 

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♞ 
        else 
            @symbol = :♘
        end 
    end 
    def move_diffs
        return [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
    end 

    def dup(dup_board)
        return Knight.new(@color, dup_board, @pos)
    end 
end 
require_relative "modules.rb"

class King
    include Stepable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = ♔
        else 
            @symbol = ♚
        end 
    end 
    def move_diffs
        return [[0,1],[0,-1],[1,0],[-1,0]]
    end 
end 

class Knight
    include Stepable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = ♘
        else 
            @symbol = ♞
        end 
    end 
    def move_diffs
        return [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
    end 
end 
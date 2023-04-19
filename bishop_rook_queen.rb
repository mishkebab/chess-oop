require_relative "modules.rb"
require_relative "pieces.rb"

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♗
        else 
            @symbol = :♝
        end 
    end 
    def move_dirs 
        return self.diagonal_dirs
    end 

    def dup(dup_board)
        return Bishop.new(@color, dup_board, @pos)
    end 
end 

class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♖
        else 
            @symbol = :♜
        end 
    end 
    def move_dirs 
        return self.horizontal_dirs
    end 

    def dup(dup_board)
        return Rook.new(@color, dup_board, @pos)
    end 
end 

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♕
        else 
            @symbol = :♛
        end 
    end 
    def move_dirs 
        return self.horizontal_dirs + self.diagonal_dirs
    end 

    def dup(dup_board)
        return Queen.new(@color, dup_board, @pos)
    end 
end 
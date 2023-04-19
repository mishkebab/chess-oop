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
end 
require_relative "modules.rb"

class Bishop
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = ♗
        else 
            @symbol = ♝
        end 
    end 
    def move_dirs 
        return self.diagonal_dirs
    end 
end 

class Rook
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = ♖
        else 
            @symbol = ♜
        end 
    end 
    def move_dirs 
        return self.horizontal_dirs
    end 
end 

class Queen
    include Slideable
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = ♕
        else 
            @symbol = ♛
        end 
    end 
    def move_dirs 
        return self.horizontal_dirs + self.diagonal_dirs
    end 
end 
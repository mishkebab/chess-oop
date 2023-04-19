

class Player 
    attr_reader :color 
    def initialize(color, display)
        @color = color
        @display = display
    end
end 

class HumanPlayer < Player
    def make_move 
        pos_1 = nil
        until pos_1 
            pos_1 = @display.cursor.get_input
            @display.render 
        end 
        if @display.board[pos_1].color != self.color 
            raise WrongColorError
        end 

        pos_2 = nil 
        until pos_2
            pos_2 = @display.cursor.get_input
            @display.render 
        end 

        @display.board.move_piece(pos_1, pos_2)
        @display.render 

        rescue WrongColorError 
            puts "not your piece - select again"
            @display.cursor.toggle_selected
            retry 

        rescue ValidError
            puts "not a valid move - select again"
            retry 
    end
end

class WrongColorError < StandardError
end 
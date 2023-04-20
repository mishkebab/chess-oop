

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


class ComputerPlayer < Player 
    def make_move
        piece_to_move = Hash.new {Array.new}
        piece_to_take = Array.new(50) {Array.new}
        @display.board.board.each do |row|
            row.each do |piece|
                if piece.color == self.color
                    moves = all_moves(piece)
                    piece_to_move[piece] += all_moves(piece) if !moves.empty?
                end
            end
        end
        # {piece: [pos,pos1,pos2]}
        # {value: [[start,end], [start,end]]}

        piece_to_move.each do |piece, moves|
            moves.each do |move|
                check_value = 0
                if piece.move_into_check?(move, :w)
                    check_value = 10
                end
                if piece.move_into_checkmate?(move, :w)
                    check_value = 30
                end
                piece_to_take[@display.board[move].value + check_value] << [piece.pos, move]
            end 
        end


        # piece = piece_to_move.keys.sample

        # start_pos = piece.pos

        # end_pos = piece_to_move[piece].sample

        # value + 10 if in check
        positions = []
        sampled = false
        iterator = 49
        while iterator >= 0
            if piece_to_take[iterator].length > 0 && !sampled
                start_pos, end_pos = piece_to_take[iterator].sample
                positions << start_pos
                positions << end_pos
                sampled = true
            end
            iterator -= 1
        end
        @display.board.move_piece(positions[0], positions[1])
    end

    private
    def all_moves(piece)
        return piece.valid_moves
    end
end

class WrongColorError < StandardError
end 
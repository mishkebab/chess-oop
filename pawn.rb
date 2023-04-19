

class Pawn < Piece
    def initialize(color, board, pos)
        super
        if @color == :w
            @symbol = :♟
        else 
            @symbol = :♙
        end 
    end 

    def at_start_row?
        if @color == :w && @pos[0] == 1
            return true 
        elsif @color == :b && @pos[0] == 6
            return true
        else
            return false
        end 
    end 

    def forward_dir
        if @color == :w 
            return 1 
        else
            return -1
        end
    end 

    def on_board?(pos)
        row, col = pos
        if !(0..7).to_a.include?(row) || !(0..7).to_a.include?(col)
            return false
        end
        true 
    end 

    def forward_steps 
        results = []
        dup_pos = self.pos.map(&:dup)
        dup_pos[0] += forward_dir
        if self.on_board?(dup_pos) && @board[dup_pos].empty?
            results << dup_pos.map(&:dup)
            dup_pos[0] += forward_dir
            if self.on_board?(dup_pos) && @board[dup_pos].empty?
                results << dup_pos
            end
        end 
        results 
    end

    def side_attacks
        attacks = []
        left_attack = [(self.pos[0] + forward_dir), pos[1] - 1]
        right_attack = [(self.pos[0] + forward_dir), pos[1] + 1]
        if self.on_board?(left_attack) && @board[left_attack].color && @board[left_attack].color != self.color
            attacks << left_attack
        end 

        if self.on_board?(right_attack) && @board[right_attack].color && @board[right_attack].color != self.color
            attacks << right_attack
        end 

        attacks 
    end 

    def moves
        forward_steps + side_attacks
    end 

    def dup(dup_board)
        return Pawn.new(@color, dup_board, @pos)
    end 

end 
module Stepable
    def moves 
        results = []
        move_diffs.each do |transform|
            temp = self.pos.map(&:dup) 
            temp[0] += transform[0]
            temp[1] += transform[1]
            if self.color != self.board[temp].color 
                results << temp 
            end
        end 
        results
    end 

    private 
    def move_diffs
    end 
end 

module Slideable
    private 
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    public 

    def horizontal_dirs 
        return HORIZONTAL_DIRS
    end 

    def diagonal_dirs 
        return DIAGONAL_DIRS
    end

    def moves
        potential_dirs = self.move_dirs 
        results = []
        potential_dirs.each do |dir|
            limit = grow_unblocked_moves_in_dir(dir[0], dir[1])
            while limit > 0
                temp = self.pos.map(&:dup)
                temp[0] += dir[0]
                temp[1] += dir[1]
                limit -= 1
                results << temp.map(&:dup)
            end 
        end
        results
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        count = 0 
        collision = false 
        until collision
            cur_pos = self.pos.map(&:dup)
            count += 1
            cur_pos[0] += dx
            cur_pos[1] += dy
            if !(0..7).to_a.include?(cur_pos[0]) || !(0..7).to_a.include?(cur_pos[1])
                collision = true 
                count -= 1
            elsif !self.board[cur_pos].empty? 
                collision = true
                if self.color == self.board[cur_pos].color 
                    count -= 1
                end
            end 
        end 
        count 
    end 



end 


module Stepable
    def moves
        moves = []

        move_diffs.each do |move|
            
            start_pos = pos.dup
            start_pos[0] += move[0]
            start_pos[1] += move[1]

            other_piece = board[start_pos]

            if (0..7).include?(start_pos[0]) && (0..7).include?(start_pos[1])
    
                if other_piece != nil  
                    moves << start_pos if self.color != other_piece.color
                else
                    moves << start_pos
                end    
            end
        end

        moves 
    end

    private
    def move_diffs
        
    end
end
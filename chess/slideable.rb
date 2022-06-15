module Slideable

    HORIZONTAL_DIRS = [ [0, 1], [0, -1], [1, 0], [-1, 0] ].freeze
    DIAGONAL_DIRS = [ [1, 1], [-1, 1], [1, -1], [-1, -1] ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []

        move_dirs.each do |move|
            row, col = move 

            moves += grow_unblocked_moves_in_dir(row, col)
        end

        moves 

    end

    private
    def move_dirs
        raise NotImplementedError 
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        start_pos = pos.dup
   

        while (0..7).include?(start_pos[0]) && (0..7).include?(start_pos[1])
            start_pos[0] += dx 
            start_pos[1] += dy 
            other_piece = board[start_pos]

            if other_piece != nil  
                moves << start_pos if self.color != other_piece.color
                break 
            end    
        end
        moves 
    end
end



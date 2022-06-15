require_relative 'piece'

class Pawn < Piece
    def symbol
        :P.colorize(color)
    end

    def moves
        row, col = pos 

        row += forward_steps

        side_attacks << [row, col]

    end

    private
    def at_start_row?
        
        return true if pos[0] ==  1 || 6

        false 
    end

    def forward_dir

        return 1 if color == :B 
        return -1 if color == :W  

    end

    def forward_steps
        if at_start_row? 
            return 2
        else
            1
        end
    end

    def side_attacks

        row = pos[0] + forward_dir
        col = pos[1]

        left_attack = [row, col -1]
        right_attack = [row, col + 1]
        
        left_piece = board[left_attack]
        right_piece =  board[right_attack]

        attacked = []

        if left_piece != nil && color != left_piece.color
            attacked << left_attack
        end

        if right_piece != nil && color != right_piece.color
            attacked << right_attack
        end

        attacked 
    end
end
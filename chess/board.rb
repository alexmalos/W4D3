require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'knight'
require_relative 'pawn'
require_relative 'null_piece'
require_relative 'rook'

class Board 
    
    def initialize
        @rows = Array.new(8){Array.new(8)}
        populate
    end

    # def piece
    #     [0,1,6,7].each do |row|
    #         (0..7).each do |col|
    #             @rows[row][col] = NullPiece.instance
    #         end
    #     end
    # end

    def populate
        null_piece
        pawn
        rook
        bishop
        knight
        queen
        king
    end

    def null_piece
        (2..5).each do |row|
            (0..7).each do |col|
                @rows[row][col] = NullPiece.instance
            end
        end
    end

    def pawn
        
        [1,6].each do |row|
            (0..7).each do |col|
                if row == 1
                    color = :B
                else
                    color = :W
                end
                @rows[row][col] = Pawn.new(color, self, [row, col])
            end
        end

    end

    def rook
        
        [0,7].each do |row|
            [0,7].each do |col|
                if row == 0
                    color = :B
                else
                    color = :W
                end
                @rows[row][col] = Rook.new(color, self, [row, col])
            end
        end

    end

    def knight 
        
        [0,7].each do |row|
            [1,6].each do |col|
                if row == 0
                    color = :B
                else
                    color = :W
                end
                @rows[row][col] = Knight.new(color, self, [row, col])
            end
        end

    end

    
    def bishop 
        
        [0,7].each do |row|
            [2,5].each do |col|
                if row == 0
                    color = :B
                else
                    color = :W
                end
                @rows[row][col] = Bishop.new(color, self, [row, col])
            end
        end

    end

    def queen 
        
        [0,7].each do |row|
            if row == 0
                color = :B
            else
                color = :W
            end
            @rows[row][3] = Queen.new(color, self, [row, 3])
        end

    end

    def king 
        
        [0,7].each do |row|
            if row == 0
                color = :B
            else
                color = :W
            end
            @rows[row][4] = King.new(color, self, [row, 4])
        end 
    end

    def [](pos)
        row, col = pos 
        @rows[row][col]
    end
    def []= (pos, val)
        row, col = pos
        @rows[row][col] = val 
    end
    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise   'there is no piece at start_pos'
        end

        if self[end_pos] != nil
            raise 'piece cannot move to end_pos'
        end

        self[end_pos] = self[start_pos]

        self[start_pos] = nil
    
    end

    def valid_pos?(pos)
        row, col = pos
        (0..7).include?(row) && (0..7).include?(col)

    end

    def in_check?(color)
        king_pos = nil

        rows.flatten.each do |piece|
            if piece.color == color && piece.symbol == :K
                king_pos = piece.pos
                break
            end
        end

        rows.flatten.each do |piece|
            if piece.color != color && moves.include?(king_pos)
                return true
            end
        end

        false
    end

    def checkmate?(color)
        if in_check?(color) && 
    end

    private
    attr_reader :rows
end
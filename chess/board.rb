class Board 
    
    def initialize()
        @rows = Array.new(8){Array.new(8)}
        piece
        # nil_piece
        # pawn
        # rook
        # bishop 
        # queen
        # king
    end

    def piece
        [0,1,6,7].each do |row|
            (0..7).each do |col|
                @rows[row][col] = Piece.new
            end
        end
    end

    # def nil_piece
    #     (2..5).each do |row|
    #         (0..7).each do |col|
    #             rows[row][col] = NullPiece.new
    #         end
    #     end
    # end

    # def pawn
        
    #     [1,6].each do |row|
    #         (0..7).each do |col|
    #             rows[row][col] = Pawn.new
    #         end
    #     end

    # end

    # def rook
        
    #     [0,7].each do |row|
    #         [0,7].each do |col|
    #             rows[row][col] = Rook.new
    #         end
    #     end

    # end

    # def knight 
        
    #     [0,7].each do |row|
    #         [1,6].each do |col|
    #             rows[row][col] = Knight.new
    #         end
    #     end

    # end

    
    # def bishop 
        
    #     [0,7].each do |row|
    #         [2,5].each do |col|
    #             rows[row][col] = Bishop.new
    #         end
    #     end

    # end

    # def queen 
        
    #     [0,7].each do |row|
    #         rows[row][3] = Queen.new
    #     end

    # end

    # def king 
        
    #     [0,7].each do |row|
    #         rows[row][4] = King.new
    #     end 
    # end

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
end
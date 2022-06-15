class Piece
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol
    end

    def empty?
        symbol == :N
    end

    def valid_moves

    end

    def pos=(val)

    end

    def symbol

    end

    attr_reader :color

    private
    attr_accessor :pos
    attr_reader :board

    def move_into_check?(end_pos)
        new_board = board.dup
        new_board.move_piece(pos, end_pos)
        new_board.in_check?(color)
    end
end
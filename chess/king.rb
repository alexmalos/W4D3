require_relative "stepable"
require_relative "piece"

class King < Piece
    include Stepable

    def symbol
        :Ki
    end

    protected
    def move_diffs
       [[-1, -1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0]]
    end
end
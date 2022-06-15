require_relative 'slideable'
require_relative 'piece'

class Queen < Piece 
    include Slideable

    def symbol
        :Q.colorize(color)
    end

    private
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end
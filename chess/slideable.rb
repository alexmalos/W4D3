module Slideable
    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def horizontal_dirs
        possible_positions = []
        row, col = pos
        (0..7).each do |i|
            possible_positions << [row, i]
            possible_positions << [i, col]
        end
        possible_positions
    end

    def diagonal_dirs
        possible_positions = []
        row, col = pos
        (1..7).each do |i|
            if (0..7).include?(row + i) && (0..7).include?(col + i)
                possible_positions << [row + i, col + i]
            end
            if (0..7).include?(row + i) && (0..7).include?(col - i)
                possible_positions << [row + i, col - i]
            end
            if (0..7).include?(row - i) && (0..7).include?(col + i)
                possible_positions << [row - i, col + i]
            end
            if (0..7).include?(row - i) && (0..7).include?(col - i)
                possible_positions << [row - i, col - i]
            end
        end
        possible_positions
    end

    def moves

    end

    private
    def move_dirs

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        
    end
end


# unblocked_moves = []
#dx, dy = end_pos 
# 
#horizontal = horizontal_dirs
#diagonal = diagonal_dirs 

#horizontal.each do |end_pos|
#   unblocked_moves << end_pos if end_pos == nilPiece
#end

# diagonal.each do |end_pos|
#    unblocked_moves << end_pos if  end_pos == nilPiece
# end 
#return unblocked_moves 
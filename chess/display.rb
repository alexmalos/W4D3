require "colorize"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        (0..7).each do |row|
            (0..7).each do |col|
                if [row, col] == cursor.cursor_pos
                    print ' '.colorize(:background => :yellow)
                else
                    print ' '.colorize(:background => :green)
                end
            end
            puts
        end
    end

    def run
        loop do
            render
            cursor.get_input
        end
    end

    private
    attr_reader :cursor
end
require_relative "cursor.rb"
require "colorize"

class Display
    attr_reader :board, :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        system("clear")
        (0..7).each do |row|
            row_string = ""
            (0..7).each do |col|
                if board[[row,col]].empty?
                    temp = "   "
                else
                    temp = " #{board[[row,col]].to_s} "
                end
                if cursor.cursor_pos == [row, col]
                    row_string += temp.colorize(:background => :red)
                elsif (row + col)%2 == 0 
                    row_string += temp.colorize(:background => :blue)
                else
                    row_string += temp.colorize(:background => :brown)
                end
            end
            puts row_string
        end
    end
end
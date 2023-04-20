require_relative "board.rb"
require_relative "player.rb"

class Game
    attr_reader :board, :display, :current_player
    def initialize(computer = false)
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(:w, @display)
        if !computer
            @player2 = HumanPlayer.new(:b, @display)
        else
            @player2 = ComputerPlayer.new(:b, @display)
        end
        @current_player = @player1
    end 

    def notify_players
        if @current_player.color == :w 
            puts "it's white's turn"
            if @board.in_check?(:w)
                puts "you are in check"
            end 
        else
            puts "it's black's turn"
            if @board.in_check?(:b)
                puts "you are in check"
            end 
        end
    end 

    def play
        until @board.checkmate?(:b) || @board.checkmate?(:w)
            @display.render
            notify_players
            @current_player.make_move
            swap_turn!
        end 
        @display.render
        puts "checkmate - game over!"
    end 

    private 

    def swap_turn!
        if @current_player == @player1
            @current_player = @player2
        else 
            @current_player = @player1
        end 
    end 


end 
require 'tic_tac_toe/player'


module TicTacToe
  module Players
  	class Human < TicTacToe::Player
  		def move(board)
        input = game.solicit_move
        game.quit if should_quit?(input)
        board.place_piece(input.to_i, marker)
      end

      def should_quit?(input)
        input =~ /q/i
      end

  
    end
  end
end

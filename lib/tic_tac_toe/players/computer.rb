require 'tic_tac_toe/player'

module TictacToe
  module Players
    class Computer < TicTacToe::Player
      attr_reader :best_choice

      def initialize(marker, name)
        super(marker, name)
        @opponent = switch(marker)
      end

      def move(board)
        game.thinking(marker)
        minmax(board, marker)
        board.mark_board(best_choice, marker)
      end

      def minmax(board, current_player)
        return score(board) if game_over?(board)

        scores = {}

        board.available_spaces.each do |space|
          # Copy board so we don't mess up original
          potential_board = board.dup
          potential_board.place_piece(space, current_player)

          scores[space] = minmax(potential_board, game.switch!)
        end

        @best_choice, best_score = best_move(current_player, scores)
        best_score
      end

      def game_over?(board)
        board.winner || board.tie?
      end

      def best_move(marker, scores)
        if marker == @marker
          scores.max_by { |_k, v| v }
        else
          scores.min_by { |_k, v| v }
        end
      end

      def score(board)
        if board.winner == marker
          return 10
        elsif board.winner == @opponent
          return -10
        end
        0
      end

    end
  end
end

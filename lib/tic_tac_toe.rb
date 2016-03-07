require_relative "tic_tac_toe/version"

module TicTacToe
  # Your code goes here...
end
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/tic_tac_toe/**/*.rb"].each { |file| require file }
require_relative "./tic_tac_toe/cell.rb"
require_relative "./tic_tac_toe/player.rb"
require_relative "./tic_tac_toe/board.rb"
require_relative "./tic_tac_toe/game.rb"
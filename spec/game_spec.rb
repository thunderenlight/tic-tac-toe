require "spec_helper"


module TicTacToe
  describe Game do

    let (:bob) { Player.new({name: "bob", marker: "X"}) }
    let (:frank) { Player.new({name: "frank", marker: "O"}) }
    # let (:game) { Game.new([bob, frank]) }


  	context "#initialize" do 
  		it "is initialized with a new board" do
			game = Game.new 
      expect(game).to_not eql nil			
  		end

  		it "can be initialized with with default grid " do
 			game = Game.new
 			expect(game.board.grid.flatten.length).to eq 9		
  		end
  	end
    context "#get_who_goes_first" do
      it "asks the player who goes first" do
        game = Game.new
        player_1 = Player.new(name: "bob", marker: "X")
        player_2 = Player.new(name: "frank", marker: "O")
        allow(game).to receive(:player_1) { player_1 }
        allow(game).to receive(:player_2) { player_2 }
        expected ="Who goes first? Press 1 for bob or press 2 for frank"
        expect(game.get_who_goes_first).to eq expected
      end
    end
     context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new
        player_1 = Player.new(name: "bob", marker: "X")
        player_2 = Player.new(name: "frank", marker: "O")
        # puts "#{player_1.name}"
        allow(game).to receive(:bob) { bob }
        expected = "Where would you lke to move bob ? Enter a number between 1 and 9 to make your move: "
        expect(game.solicit_move).to eq expected
      end
    end
    describe '#get_player_info' do
    it 'creates players from console input' do
      game = Game.new
      game.stub(:gets).and_return("bob", "x", "2", "frank", "z")
      game.get_player_info
      expect(game.player_1.name).to eq 'bob'
      expect(game.player_1.marker).to eq 'x'
      expect(game.player_2.name).to eq 'frank'
      expect(game.player_2.marker).to eq 'z'
    end
  end

  end
end

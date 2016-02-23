require "spec_helper"

module TicTacToe
	describe Player do
		context "#initialize " do
			it "raises an exception when initialized with {}" do
				expect { Player.new({}) }.to raise_error
			end
			it "initializes with a valid input hash " do
			input = { mark	: "X", name: "Tabu"}
				expect { Player.new(input) }.to_not raise_error
			end 
		end

		context "#name" do
			it "returns the name" do 
				input = { mark	: "X", name: "Tabu"}
				player = Player.new(input)
				expect(player.name).to eq "Tabu"
			end	
		end

		context "#mark	" do
			it "returns the mark	" do
				input = { mark	: "X", name: "Tabu"}
				player = Player.new(input)
				expect(player.mark	).to eq "X"				
			end
		end
	end
end

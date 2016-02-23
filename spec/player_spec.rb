require "spec_helper"

module TicTacToe
	describe Player do
		context "#initialize " do
			it "raises an exception when initialized with {}" do
				expect { Player.new({}) }.to raise_error
			end
			it "initializes with a valid input hash " do
			input = { color: "X", name: "Tabu"}
				expect { Player.new(input) }.to_not raise_error
			end 
		end

		context "#name" do
			it "returns the name" do 
				input = { color: "X", name: "Tabu"}
				player = Player.new(input)
				expect(player.name).to eq "Tabu"
			end	
		end

		context "#color" do
			it "returns the color" do
				input = { color: "X", name: "Tabu"}
				player = Player.new(input)
				expect(player.color).to eq "X"				
			end
		end
	end
end

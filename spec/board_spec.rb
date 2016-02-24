require "spec_helper"

module TicTacToe
	describe Board do
		context "#initialize" do	
			it "initializes the board with a grid" do	
				expect { Board.new(grid: "grid") }.to_not raise_error
			end

			it "sets the grid with three rows dy default" do
				board = Board.new
				expect(board.grid.size).to eq(3)
			end

			it "creates three cells in each row by default" do
				board = Board.new
				board.grid.each do |row|
					expect(row.size).to eq(3)
				end
			end
		end

		context "#grid" do 
			it "returns the grid" do
				board = Board.new(grid: "new_grid")
				expect(board.grid).to eq "new_grid"
			end				
		end

		context "#get_cell" do
			it "returns the cell based on the (x,y) coordinate" do 
				
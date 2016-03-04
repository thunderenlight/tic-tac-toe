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
				grid = [["", "", ""], ["", "", "something"], [ "", "", ]]
				board = Board.new(grid: grid)
				expect(board.get_cell(2,1)).to eq "something"
			end
		end

		context "#set_cell" do
			it "updates the value of the cell object at a (x,y) coordinate" do	
				Cat = Struct.new(:value)
				grid = [[Cat.new("cool"), "", ""], ["", "", "something"], [ "", "", ]]
				board = Board.new(grid: grid)
				board.set_cell(0,0,"meow")
				expect(board.get_cell(0,0).value).to eq "meow"
				puts board
		end
	end

		TestCell = Struct.new(:value)
		let(:x_cell) { TestCell.new("X") }
		let(:y_cell) { TestCell.new("Y") }
		let(:empty) { TestCell.new }

		context "#game_over" do
	 		it "returns :winner if winner? is true" do
		    board = Board.new
		    board.stub(:winner?) { true }
		    expect(board.game_over).to eq :winner
	  end

		  it "returns :tie if winner? is false and tie? is true" do
		    board = Board.new
		    board.stub(:winner?) { false }
		    board.stub(:tie?) { true }
		    expect(board.game_over).to eq :tie
		  end

		  it "returns false if winner? is false and tie? is false" do
		    board = Board.new
		    board.stub(:winner?) { false }
		    board.stub(:tie?) { false }
		    expect(board.game_over).to be false
		  end
		  it "returns :winner when row has objects with values that are all the same" do
		    grid = [
		      [x_cell, x_cell, x_cell],
		      [y_cell, x_cell, y_cell],
		      [y_cell, y_cell, empty]
		    ]
		    board = Board.new(grid: grid)
		    expect(board.game_over).to eq :winner
  end

		  it "returns :winner when colum has objects with values that are all the same" do
		    grid = [
		      [x_cell, x_cell, empty],
		      [y_cell, x_cell, y_cell],
		      [y_cell, x_cell, empty]
		    ]
		    board = Board.new(grid: grid)
		    puts board.draw
		    expect(board.game_over).to eq :winner
		  end

		  it "returns :winner when diagonal has objects with values that are all the same" do
		    grid = [
		      [x_cell, empty, empty],
		      [y_cell, x_cell, y_cell],
		      [y_cell, x_cell, x_cell]
		    ]
		    board = Board.new(grid: grid)
		    expect(board.game_over).to eq :winner
		  end

		  it "returns :tie when all spaces on the board are taken" do
		    grid = [
		      [x_cell, y_cell, x_cell],
		      [y_cell, x_cell, y_cell],
		      [y_cell, x_cell, y_cell]
		    ]
		    board = Board.new(grid: grid)
		    expect(board.game_over).to eq :tie
		  end
				end
	end
end
				
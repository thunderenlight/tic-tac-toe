module TicTacToe
	class Board
		attr_accessor :cell, :grid

		def initialize(input={})
			@grid = input.fetch(:grid, default_grid)
			# @cell = cell
		end

		def get_cell(x,y)
			cell = grid[y][x]
		end

		def set_cell(x,y,val)
			# cell.value = val
			get_cell(x,y).value = val
		end

		def moves
			grid.compact.count
		end

		def mark_board(cell, piece)
			grid[cell] = piece
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		def draw
			grid.each do |row|
				puts row.map { |cell| cell.value.empty? ? Cell.new : cell.value }.join(" ")
			end
		end

		private
		def default_grid
			Array.new(3) { Array.new(3) { Cell.new } }
		end

		def tie?
			grid.flatten.map.select { |cell| cell == nil }.count == 0
		end

		def winner?
			winning_positions.each do |winning_position|
				next if winning_places(winning_position).count == 0
				return true if winning_places(winning_position).all? do |place|
					place == self[0]
					end
				end
			false
		end

		

		def winning_position_values(winning_position)
      		winning_position.map { |cell| cell.value }
    	end

    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end
  end

end
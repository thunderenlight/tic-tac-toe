module TicTacToe
	class Board
		attr_accessor :cell, :grid

		def initialize(input={}, board = nil)
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

		def mark_board(cell, marker)
			grid[cell] = marker
		end

		def game_over
			return :winner if winner?
			return :tie if tie?
			false
		end

		def draw
			# @grid.each do |row|
			# 	puts row.map { |cell| cell.value.empty? ? Cell.new : cell.value }.join(" ")
			# end
			 # @grid.each do |row|
    #     puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
    #   end
    	@grid.each_with_index do |row, r_index|
    		row.each_with_index do |cell, c_index|
    			if r_index !=2
    				print c_index == 2 ? "#{cell} \n" : "#{cell} |" 
    			# else
    			# 	print c_index == 2 ? "#{cell} \n" : "#{cell} |" 
    			end
    		end
    		print "---+----+----\n" unless r_index ==2
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
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
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


    def initialize_dup(other)
      super(other)
      @grid = other.grid.dup
    end

  end

end

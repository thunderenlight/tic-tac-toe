module TicTacToe
	class Player
		attr_reader :marker, :name
		def initialize(input)
			@mark = input.fetch(:marker)
			@name = input.fetch(:name)
		end
		def to_s
			marker
		end
	end
end

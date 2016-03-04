
# I need an unbeatable computer or AI program, decent user interface or console display, and protection from bad input.
# User picks who goes first
#User picks her mark and 
#User picks if playing AI or another user
#User chooses mark for themselves and AI

module TicTacToe
	class Game
		attr_reader :player_1, :player_2, :board

		def initialize
			get_prefs
			@board = Board.new(grid = nil)		
		end

		def get_prefs
			welcome
			get_num_of_players
			get_player_info
		end

		def welcome
		 puts 'Welcome to Command Line Games Tic Tac Toe!'
         puts 'Two players choose a name and marker like: name Chris and marker is a X; and start playing.'
    	end

    	def get_num_of_players
    		puts 'Enter 1 for single player. 2 for two players.'
      		num = gets.strip.to_i
      		num
    	end

    	def get_player_info	
	      begin
	        print "\nPlayer 1\n\tname: "
	        p1_name = gets.strip
	        fail EmptyStringError if p1_name == ''
	      rescue StandardError => e
	        puts e.message
	      	retry
	      end
	      begin
	        print "\n\tmarker: "
	        p1_marker = gets.strip
	        fail EmptyStringError if p1_marker == ''
	        fail MaxLengthError if p1_marker.length > 1
		    rescue StandardError => e
		        puts e.message
		      retry
	      end
	      @player_1 = Player.new(p1_name, p1_marker)
	      

	      if get_num_of_players  == 1
	      	begin
		      	c_name = 'computer'
		      	print "#{c_name}:"
		      	print "What marker would you like to assign to the computer?"
		      	c_marker = gets.strip
		      	fail DuplicateError if c_marker == p1_marker
		      	fail EmptyStringError if c_marker.strip == ''
	        rescue StandardError => e
	      		puts e.message
	      		retry
	    	end
		  else
		  	begin 
		  		print "Player 2 \n\tname: "
		  		p2_name = gets.strip
		        fail DuplicateError if p2_name == p1_name 
		        fail EmptyStringError if p1_name == ''
		      rescue StandardError => e
		        puts e.message
		      retry
	    	end
	    	begin 
	    		print "\n\tmarker: "
	    		p2_marker = gets.strip
	    		fail DuplicateError if p2_marker == p1_marker
	    		fail EmptyStringError if p2_marker.strip == ''
	    		fail MaxLengthError if p2_marker.strip > 1
	    		rescue StandardError => e
	    		puts e.message
	    		retry 
	    	end
	    	@player_2 = Player.new(p2_name, p2_marker)
	    end
	  end

	  def get_who_goes_first
	  	"Who goes first? Press 1 for #{@player_1.name} or press 2 for #{@player_2.name}"
	  	 #if user enters 1 then current player is player_1, else current player is player_2
	  	 first = gets.chomp
 			if first == '1'
		  	current_player = @player_1
		  	other_player = @player_2
		  elsif first == '2'
		  	current_player = @player_2
		  	other_player = @player_1
		  else
		  	puts "please enter 1 or 2"
	  end

	  def instructions
	      puts 'select a position to mark it as yours'
	      puts ' 1 | 2 | 3 '
	      puts '---+---+---'
	      puts ' 4 | 5 | 6 '
	      puts '---+---+---'
	      puts ' 7 | 8 | 9 '
    end

  	def play
	  	puts "#{@player_1.name} vs #{@player_2.name}" 
	  	get_who_goes_first
	  	instructions
	  	until over?
	  		@board.draw
		  	# solicit_move
	        # if current_player.is_a? NonHumanPlayer
	        # 	@board.mark
	        player.move
	      end
	  end

	  def switch!
	  	current_player, other_player = other_player, current_player
	  end

	  def over?
	  	# true if there is a tie or no cells empty or num_marks == baord.grid.cells.length 
	  	# return true if @board.grid.all?(marks)
	  	return false if @board.flatten.include?('')
	  	end
		end

		def solicit_move
		  print "Where would you lke to move #{current_player.name} ? Enter a number between 1 and 9 to make your move: "
	  	gets.chomp
		end

		# def get_move(solicit_move)
		# 	translate_move(solicit_move)
		# end

		def translate_move(human_move)
	      mapping = {
	        "1" => [0, 0],
	        "2" => [1, 0],
	        "3" => [2, 0],
	        "4" => [0, 1],
	        "5" => [1, 1],
	        "6" => [2, 1],
	        "7" => [0, 2],
	        "8" => [1, 2],
	        "9" => [2, 2]
	      }
	      mapping[human_move]
	  end

	end
end
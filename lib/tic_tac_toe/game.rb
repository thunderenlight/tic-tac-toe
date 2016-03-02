
# I need an unbeatable computer or AI program, decent user interface or console display, and protection from bad input.
# User picks who goes first
#User picks her mark and 
#User picks if playing AI or another user
#User chooses mark for themselves and AI

module TicTacToe
	class Game
		attr_reader :player_1, :player_2

		def initialize(grid)
			get_prefs
			
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
	      #   fail EmptyStringError if p1_name == ''
	      # rescue StandardError => e
	      #   puts e.message
	        retry
	      end
	      begin
	        print "\n\tmarker: "
	        p1_marker = gets.strip
	      #   fail EmptyStringError if p1_marker == ''
	      #   fail MaxLengthError if p1_marker.length > 1
	      # rescue StandardError => e
	      #   puts e.message
	        retry
	      end
	      @player_1 = Player.new(p1_name, p1_marker)
	      if get_num_of_players  == 1
	      	c_name = 'computer'
	      	print "#{c_name}:"
	      	print "What marker would you like to assign to the computer?"
	      	c_marker = gets.strip
	      # 	fail DuplicateError if c_marker == p1_marker 
	      # rescue StandardError => e
	      # 	puts e.message
	      # retry
		  else
		  	begin 
		  		print "Player 2 \n\tname: "
		  		p2_name = gets.strip
		      #   fail DuplicateError if p2_name == p1_name 
		      #   fail EmptyStringError if p1_name == ''
		      # rescue StandardError => e
		      #   puts e.message
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

	  def play
	  	puts "#{@player_1.name} vs #{@player_2.name}"

	  	current
	  end

	  def switch!
	  	current_player, other_player = other_player, current_player
	  end

	end
end
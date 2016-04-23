class Game
	attr_reader :players, :current_player, :other_player, :board
	
	def initialize(players, board = Board.new)
		@players = players
		@board = board
		@current_player, @other_player = players
	end

	def swap_players
		@current_player, @other_player = @other_player, @current_player
	end

	def make_move
		puts "#{current_player.name}, your move"
	end

	def get_move
		input = gets.chomp
		input = check_move(input)
		board.get_grid_co_ords(input)
	end



	def play
		welcome_message
		counter = 0
		while true
			make_move
			x, y = get_move
			board.set_cell(x, y, current_player.color)
			board.updated_grid
			if board.game_over
				game_over_message
				return
			else
			swap_players
			end
		end
	end

	private
	def welcome_message
		puts "welcome to TIC TAC TOE game"
		puts ""
		puts "#{current_player.name} is selected randomly as first player"
		board.updated_grid
	end

	def game_over_message
		puts "#{current_player.name} won the game" if board.game_over == :winner
		puts "Game ended in tie" if board.game_over == :draw
	end

	def check_move(input)
		array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		while true
			x, y = input
			if array.any? { | element | element === input.to_i}
				return input
				false

				if board.get_cell(x, y).empty?
					puts "cell occupied"
					input = gets.chomp
					input
				else
					return input
					false
				end	
						
			else
				puts ""
				puts "Please enter a number between 1 and 9 only"
				puts ""
				input = gets.chomp
				input
			end
			true
		end
	end
	
end
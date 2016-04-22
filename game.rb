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
		"welcome to TIC TAC TOE game"
		""
	end

	def game_over_message
		puts "#{current_player.name} won the game" if board.game_over == :winner
		puts "Game ended in tie" if board.game_over == :draw
	end

end
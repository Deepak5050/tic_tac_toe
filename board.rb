class Board
	attr_reader :grid

	def initialize(input = {})
		@grid = input.fetch(:grid, default_grid)
	end

	def get_cell(x, y)
		grid[x][y]
	end

	def set_cell(x,y, value)
		get_cell(x, y).value = value
	end

	def updated_grid
		puts " "
		grid.each do |row|
			puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" | ")
		end
		puts " "
	end

	def get_grid_co_ords(input)
		mapping = {
			"1" => [0, 0],
			"2" => [0, 1],
			"3" => [0, 2],
			"4" => [1, 0],
			"5" => [1, 1],
			"6" => [1, 2],
			"7" => [2, 0],
			"8" => [2, 1],
			"9" => [2, 2]
		}

		mapping[input]
	end

	def game_over
		return :winner if winner?
		return :draw if draw?
		false
	end

	private
	def default_grid
		Array.new(3) { Array.new(3) { Cell.new }}
	end

	def winner?
		winning_positions.map do | winning_position |
			next if winning_position_values(winning_position).all_empty?
			return true if winning_position_values(winning_position).all_same?
		end
		false
	end

	def winning_position_values(winning_position)
		winning_position.map { |cell| cell.value }
	end

	def winning_positions
		grid +
		grid.transpose +
		diagonals
	end

	def diagonals
		[
			[get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
      [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
		]
	end

	def draw?
		grid.flatten.map { |cell| cell.value }.none_empty? 
	end

	
end
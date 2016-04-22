class Array
	def all_same?
		self.all? { |cell| cell == self[0]}
	end

	def all_empty?
		self.all? { |cell| cell.to_s.empty? }
	end

	def any_empty?
		self.any? { |cell| cell.to_s.empty? }
	end

	def none_empty?
		!any_empty?
	end
end
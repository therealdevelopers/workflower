class Grid
	include ActiveModel::Validations

	def initialize(max_x, max_y)
		@max_x = max_y
		@max_y = max_y
		@cells = Array.new(@max_y) { Array.new(@max_x) { nil } }
	end

	def cells
		@cells
	end

	def cells_empty
		nil
	end
		#Some CRUD methods
	
	#"battery" - methods for accessing cells of a grid
	def [](x, y)
		@cells[y][x]
	end

	def []=(x, y, value)
		@cells[y][x] = Cell.new(x: x, y: y, content: value) if (coords_valid?(x, y))
		@cells[y][x] = Cell.new(x: x, y: y, content: value.content) if (coords_valid?(x, y) && value.is_a?(Cell))
	end

	#Creates a new cell and places it on the glrid on a set coordinates
	def add_cell(options = {})
		if ((!options[:x].nil?) && (!options[:y].nil?))
			c = Cell.new(x: options[:x], y: options[:y])
			c.content = options[:content] unless options[:content].nil?
			self[c.x, c.y] = c if coords_valid?(c.x, c.y)
		end
	end

	#Creates an empty cell on a set coordinates
	def new_cell(x, y)
		add_cell(x: x, y: y)
	end

	#Searches for a cell on the set coordinates. 
	#Returns Cell or nil. 
	#Works similar to "battery" - method
	def find_cell(x, y)
		self[x, y]
	end

	#Deletes a cell with set coordinates from the grid.
	#Returns the deleted cell.
	def find_and_remove_cell(x, y)
		c = find_cell(x, y)
		remove_cell(x, y)
		c
	end
  
	#Deletes a cell with set coordinates from the grid.
	def remove_cell(x, y)
		self[x, y].nil? ? nil : self[x, y] = nil
	end

	private

	def coords_valid?(x, y)
		Cell.new(x: x, y: y).valid? && 
		(x <= @max_x && y <= @max_y)
	end
end
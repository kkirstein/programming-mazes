# grid.rb
#
# vim: ft=ruby sw=2 ts=2
#
# grid class contains all cells of the maze
#

require_relative "cell.rb"

class Grid

	attr_reader :rows, :columns

	# constructor
	def initialize(rows, columns)
		@rows, @columns = rows, columns

		@grid = prepare_grid
		configure_cells
	end

	# prepare 2D Array for cells
	# (might be overridden for other geometries)
	def prepare_grid
		Array.new(rows) do |row|
			Array.new(columns) do |col|
				Cell.new(row, col)
			end
		end
	end

	# configure neighborhood of populated grid array
	# (might be overridden for other geometries)
	def configure_cells
		each_cell do |cell|
			row, col = cell.row, cell.column

			cell.north = self[row - 1, col]
			cell.south = self[row + 1, col]
			cell.east = self[row, col + 1]
			cell.west = self[row, col - 1]
		end
	end

	# [] operator to access individual cells
	# returns nil if out of bound
	# (might be overridden for wrap-around geometries, like cylinder or toroidal mazes)
	def [](row, column)
		return nil unless row.between?(0, @rows-1)
		return nil unless column.between?(0, @columns-1)
		@grid[row][column]
	end

	# select a random cell
	def random_cell
		row = rand(@rows)
		column = rand(@grid[row].count)
		self[row, column]
	end

	# returns the overall size of grid
	def size
		@rows * @columns
	end

	# iterator for each row of cells
	def each_row
		@grid.each do |row|
			yield row
		end
	end

	# iterator for each single cell
	def each_cell
		each_row do |row|
			row.each do |cell|
				yield cell if cell
			end
		end
	end

	# output grid as ASCII art
	def to_s
		# top border
		output = "+" + "---+" * columns + "\n"

		each_row do |row|
			top = "|"
			bottom = "+"

			row.each do |cell|
				# create a dummy, if no cell present (used by special geometries)
				cell = Cell.new(-1, -1) unless cell

				body = "   " # 3 spaces
				east_boundary = (cell.linked?(cell.east) ? " " : "|")
				top << body << east_boundary

				south_boundary = (cell.linked?(cell.south) ? "   " : "---")
				corner = "+"
				bottom << south_boundary << corner
			end

			output << top << "\n"
			output << bottom << "\n"
		end

		output
	end

end


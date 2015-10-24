# cell.rb
#
# vim: ft=ruby sw= ts=2
#
# cell class as basic element for a maze
#

class Cell

	attr_reader :row, :column
	attr_accessor :north, :south, :east, :west

	# constructor
	def initialize(row, column)
		@row, @column = row, column
		@links = {}
	end

	# add link (passage) to other cell
	def link(cell, bidi = true)
		@links[cell] = true
		cell.link(self, false) if bidi
	end

	# remove link (passage) to other cell
	def unlink(cell, bidi = true)
		@links.delete(cell)
		cell.unlink(self, false) if bidi
	end

	# returns all linked cells
	def links
		@links.keys
	end

	# checks whether a cell is linked
	def linked?(cell)
		@links.key? cell
	end

	# returns neighbors of the cell
	def neighbors
		list = []
		list << north if north
		list << south if south
		list << east if east
		list << west if west
		list
	end

end


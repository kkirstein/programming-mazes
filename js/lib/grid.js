// grid.js
//
// vim: ft=javascript sw=4 ts=4
//
// grid class contains all cells of the maze
//

'use strict';

var cell = require('cell.js');

class Grid {

	constructor(rows, columns) {
		this.rows = rows;
		this.columns = columns;

		this.grid = prepare_grid();
		configure_cells();
		}

	// prepare 2D array for cells
	// (might be overridden for different geometries
	prepare_grid() {
		rows = new Array(rows);
		for (r in rows) {
			// TODO
		}
	}

	// configure neighborhood of populated grid array
	// (might be overridden for different geometries
	configure_cells() {
		// TODO: Loop over grid array and set north, south, .. neighbors
	}

	// access individual cells
	// returns null if out of bounds
	get_cell(row, column) {
		if ((row < 0) || (row > (this.rows-1)) || (column < 0) || (column > (this.columns-1))  {
			return null;
		} else {
			return this.grid[row][column];
		}
	}

	// select a random cell
	random_cell() {
		// TODO
	}

	// returns the overall size of grid
	size() {
		return this.rows * this.columns;
	}

	// iterator for each row of cells
	each_row() {
		// TODO
	}

	// iterator for each cell
	each_cell(fn) {
		// TODO
	}
}


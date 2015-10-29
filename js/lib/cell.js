// cell.js
// 
// vim: ft=javascript sw=4 ts=4
// 
// cell class as basic element for a maze
//

'use strict';

class Cell {

	constructor(row, column) {
		this.row = row;
		this.column = column;
		this.links = new Map();
		this.north = null;
		this.south = null;
		this.west = null;
		this.east = null;
	}

	// add link (passage) to other cell
	link(other, bidi = true) {
		this.links[other] = true;
		if (bidi) {
			other.link(this, false);
		}
	}

	// remove link (passage) to other cell
	unlink(other, bidi = true) {
		this.links.delete(other);
		if (bidi) {
			other.unlink(this, false);
		}
	}

	// returns all linked cells
	links() {
		return this.links.keys;
	}

	// checks whether a cell is linked
	linked?(other) {
		return this.links.has(other);
	}

	// returns neighbors of the cell
	neighbors() {
		var list = new Array(4);
		if (this.north) { list.push(this.north); }
		if (this.south) { list.push(this.south); }
		if (this.west) { list.push(this.west); }
		if (this.east) { list.push(this.east); }
	}

}


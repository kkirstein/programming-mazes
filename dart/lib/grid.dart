// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// TODO: Put public facing types in this file.

part of mazes;

/// Grid class to hold all cells of a maze
class Grid {
  int rows;
  int columns;

  List<Cell> _grid;

  Random _rand;

  // constructor
  Grid(this.rows, this.columns) {
    _grid = prepareGrid();
    configureCells();
    _rand = new Random();
  }

  // getter for grid size
  int get size => rows * columns;

  // random access of grid cells
  Cell getCell(int row, int column) {
    if (row >= 0 && row < rows && column >= 0 && column < columns) {
      return _grid[_toIdx(row, column)];
    } else {
      return null;
    }
  }
  int _toIdx(int row, int column) {
    return row * columns + column;
  }

  // populate grid
  List<Cell> prepareGrid() {
    return new List.generate(rows*columns, (i) => new Cell(i ~/ columns, i % columns));
  }

  // configure cell neighborhood
  configureCells() {
    _grid.forEach( (cell) {
      var row = cell.row;
      var col = cell.column;
      cell.north = getCell(row-1, col);
      cell.south = getCell(row+1, col);
      cell.west = getCell(row, col-1);
      cell.east = getCell(row, col+1);
    });
  }

  // select random cell
Cell randomCell() {
  var row = _rand.nextInt(rows);
  var col = _rand.nextInt(columns);

  return getCell(row, col);
}

  // dump grid for debug purpose
  dumpGrid() {
    _grid.forEach((cell) { print(cell); });
  }
}

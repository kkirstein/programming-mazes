// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// TODO: Put public facing types in this file.

part of mazes;

/// Grid class to hold all cells of a maze
class Grid {
  int rows;
  int columns;

  List<Cell> _grid;

  // constructor
  Grid(this.rows, this.columns) {
    _grid = prepareGrid();
    configureCells();
  }

  // random access of grid cells
//  Cell operator [](row, column) {
//    return _grid[row*columns + columns];
//  }
  Cell getCell(int row, int column) {
    if (row >= 0 && row < rows && column >= 0 && column < columns) {
      return _grid[row * columns + column];
    } else {
      return null;
    }
  }

  List<Cell> prepareGrid() {
    return new List.generate(rows*columns, (i) => new Cell(i % columns, i ~/ columns));
  }

  configureCells() {
    // TODO
  }

  dumpGrid() {
    _grid.forEach((cell) { print(cell); });
  }
}

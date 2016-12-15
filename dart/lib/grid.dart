// Copyright (c) 2015, Kay-Uwe Kirstein. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

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
    return new List.generate(
        rows * columns, (i) => new Cell(i ~/ columns, i % columns));
  }

  // configure cell neighborhood
  configureCells() {
    _grid.forEach((cell) {
      var row = cell.row;
      var col = cell.column;
      cell.north = getCell(row - 1, col);
      cell.south = getCell(row + 1, col);
      cell.west = getCell(row, col - 1);
      cell.east = getCell(row, col + 1);
    });
  }

  // select random cell
  Cell randomCell() {
    var row = _rand.nextInt(rows);
    var col = _rand.nextInt(columns);

    return getCell(row, col);
  }

  // iterate over each row
  void forEachRow(void action(List<Cell> row)) {
    for (int i = 0; i < rows; i++) {
      action(_grid.getRange(i * columns, (i + 1) * columns));
    }
  }

  // iterate over each cell
  void forEachCell(void action(Cell cell)) {
    _grid.forEach(action);
  }

  // pretty-print grid on console
  String toString() {
    StringBuffer output = new StringBuffer("+" + "---+" * columns + "\n");

    forEachRow((row) {
      StringBuffer top = new StringBuffer("|");
      StringBuffer bottom = new StringBuffer("+");

      row.forEach((cell) {
        var body = "   ";
        var east_boundary = (cell.linked(cell.east)) ? " " : "|";
        top.writeAll([body, east_boundary]);

        var south_boundary = (cell.linked(cell.south)) ? "   " : "---";
        var corner = "+";
        bottom.writeAll([south_boundary, corner]);
      });

      output.writeAll([top, "\n"]);
      output.writeAll([bottom, "\n"]);
    });

    return output.toString();
  }

  // generate image of maze grid
  Image toImage([int cell_size = 10]) {
    final width = cell_size * columns;
    final height = cell_size * rows;
    var img = new Image(width, height, Image.RGB);

    final background = getColor(0, 0, 0);
    final wall = getColor(255, 255, 255);

    forEachCell((cell) {
      var x1 = cell.column * cell_size;
      var y1 = cell.row * cell_size;
      var x2 = (cell.column + 1) * cell_size;
      var y2 = (cell.row + 1) * cell_size;

      if (! cell.north) img = drawLine(img, x1, y1, x2, y1, wall);
      if (! cell.west) img = drawLine(img, x1, y1, x1, y2, wall);
      if (! cell.east) img = drawLine(img, x2, y1, x2, y2, wall);
      if (! cell.south) img = drawLine(img, x1, y2, x2, y2, wall);
    });

    return img;
  }

  // dump grid for debug purpose
  dumpGrid() {
    _grid.forEach((cell) {
      print(cell);
    });
  }
}

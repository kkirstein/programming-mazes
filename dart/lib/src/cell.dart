// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of mazes;

/// Cell class a a single grid element
class Cell {

  int row, column;
  Cell north, south, east, west;

  // constructor
  Cell(this.row, this.column);
}
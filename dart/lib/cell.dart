// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of mazes;

/// Cell class a a single grid element
class Cell {

  int row, column;
  Cell north, south, east, west;
  Map<Cell, bool> _links;

  // constructor
  Cell(this.row, this.column) {
    _links = {};
  }

  // link/unlink to other cells
  link(other, [bidirect = true]) {
    _links[other] = true;
    if (bidirect) { other.link(this, false); }
  }

  unlink(other, [bidirect = true]) {
    _links.remove(other);
    if (bidirect) { other.unlink(this, false); }
  }

  links() {
    return _links.keys;
  }

  linked(other) {
    return _links.containsKey(other);
  }

  // get neighbors
  neighbors() {

  }
}
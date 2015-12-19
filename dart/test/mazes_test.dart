// Copyright (c) 2015, Kay-Uwe Kirstein. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library mazes.test;

import 'package:dart/mazes.dart';
import 'package:test/test.dart';

void main() {
  group('Cell class', () {
    Cell cell;

    setUp(() {
      cell = new Cell(1, 2);
    });

    test('constructor', () {
      expect(cell, new isInstanceOf<Cell>());
      expect(cell.row, equals(1));
      expect(cell.column, equals(2));
    });

    test('link another cell', () {
      Cell other = new Cell(3, 4);
      cell.link(other);
      expect(cell.linked(other), isTrue);
    });

    test('show all linked cells', () {
      Cell other1 = new Cell(11, 12);
      Cell other2 = new Cell(21, 22);
      cell.link(other1);
      cell.link(other2);
      expect(cell.links().length, equals(2));
      expect(cell.links(), contains(other1));
      expect(cell.links(), contains(other2));
    });
  });

  group('Grid class', () {
    Grid grid;

    setUp(() {
      grid = new Grid(4, 6);
    });

    test('constructor', () {
      expect(grid, new isInstanceOf<Grid>());
      expect(grid.rows, equals(4));
      expect(grid.columns, equals(6));
    });
  });
}

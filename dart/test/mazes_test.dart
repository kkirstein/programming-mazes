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

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
      expect(cell.north, isNull);
      expect(cell.south, isNull);
      expect(cell.west, isNull);
      expect(cell.east, isNull);
      expect(cell.neighbors(), isEmpty);
    });

    test('has links to other cells', () {
      Cell other = new Cell(3, 4);
      cell.link(other);
      expect(cell.linked(other), isTrue);
    });

    test('shows all linked cells', () {
      Cell other1 = new Cell(11, 12);
      Cell other2 = new Cell(21, 22);
      cell.link(other1);
      cell.link(other2);
      expect(cell.links().length, equals(2));
      expect(cell.links(), contains(other1));
      expect(cell.links(), contains(other2));
    });

    test('shows neighbor cells', () {
      Cell other1 = new Cell(11, 12);
      Cell other2 = new Cell(21, 22);
      expect(cell.neighbors(), isEmpty);
      cell.north = other1;
      cell.west = other2;
      expect(cell.neighbors(), hasLength(2));
      expect(cell.neighbors(), contains(other1));
      expect(cell.neighbors(), contains(other2));
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

    test('has grid of cells', () {
      var cell = grid.getCell(0,0);
      expect(cell, new isInstanceOf<Cell>());
      expect(cell.row, equals(0));
      expect(cell.column, equals(0));
      cell = grid.getCell(1,2);
      expect(cell, new isInstanceOf<Cell>());
      expect(cell.row, equals(1));
      expect(cell.column, equals(2));
    });

    test('returns null on out-of-bound access', () {
      expect(grid.getCell(4,6), isNull);
    });

    test('initializes cell neighbors', () {
      var cell = grid.getCell(2,3);
      expect(cell.north.row, equals(1));
      expect(cell.north.column, equals(3));
      expect(cell.south.row, equals(3));
      expect(cell.south.column, equals(3));
      expect(cell.west.row, equals(2));
      expect(cell.west.column, equals(2));
      expect(cell.east.row, equals(2));
      expect(cell.east.column, equals(4));
    });

    test('handles grid borders correctly', () {
      expect(grid.getCell(0, 0).north, isNull);
      expect(grid.getCell(0, 0).west, isNull);
      expect(grid.getCell(0, 0).south, new isInstanceOf<Cell>());
      expect(grid.getCell(0, 0).east, new isInstanceOf<Cell>());

      expect(grid.getCell(3, 0).south, isNull);
      expect(grid.getCell(3, 0).west, isNull);
      expect(grid.getCell(3, 0).north, new isInstanceOf<Cell>());
      expect(grid.getCell(3, 0).east, new isInstanceOf<Cell>());

      expect(grid.getCell(0, 5).north, isNull);
      expect(grid.getCell(0, 5).east, isNull);
      expect(grid.getCell(0, 5).south, new isInstanceOf<Cell>());
      expect(grid.getCell(0, 5).west, new isInstanceOf<Cell>());

      expect(grid.getCell(3, 5).south, isNull);
      expect(grid.getCell(3, 5).east, isNull);
      expect(grid.getCell(3, 5).north, new isInstanceOf<Cell>());
      expect(grid.getCell(3, 5).west, new isInstanceOf<Cell>());
    });

    test('selects a random cell', () {
      expect(grid.randomCell(), new isInstanceOf<Cell>());
    });

  });
}

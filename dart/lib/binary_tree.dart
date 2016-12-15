// Copyright (c) 2016, Kay-Uwe Kirstein. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of mazes;

class BinaryTree {

  // static method to generate links on given grid
  static Grid on(Grid grid) {
    var rand = new Random();

    grid.forEachCell((cell) {
      var neighbors = [];
      if (cell.north != null) {
        neighbors.add(cell.north);
      }
      if (cell.east != null) {
        neighbors.add(cell.east);
      }

      if (neighbors.isNotEmpty) {
        var index = rand.nextInt(neighbors.length);
        cell.link(neighbors[index]);
      }
    });

    return grid;
  }
}

// Copyright (c) 2016, Kay-Uwe Kirstein. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of mazes;

class Sidewinder {

  static Grid on(Grid grid) {
    var rand = new Random();

    grid.forEachRow((row) {
      var run = [];

      row.forEach((cell) {
        run.add(cell);

        final at_eastern_boundary = (cell.east == null);
        final at_northern_boundary = (cell.north == null);

        final should_close_out = at_eastern_boundary || (!at_northern_boundary && rand.nextInt(2)==0);

        if (should_close_out) {
          var member = run[rand.nextInt(run.length)];
          if (member.north != null) member.link(member.north);
          run.clear();
        } else {
          cell.link(cell.east);
        }
      });
    });

  }
}
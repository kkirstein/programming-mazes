// Copyright (c) 2016, Kay-Uwe Kirstein. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// sidewinder_demo.dart
//

import '../lib/mazes.dart';

main() {

  var grid = new Grid(6, 12);
  Sidewinder.on(grid);

  print(grid);
}
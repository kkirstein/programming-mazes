(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module grid
 * A data container to hold the cells of maze
 *)

type t = {
  rows : int;
  cols : int;
  cells : Cell.t list
}


(**
 * Coord module to transform between index and (spatial)
 * coordinates of the grid
 *)
module Coord = struct

end


(**
 * prepare and configure the cells in the grid
 *)
let prepare rows cols =
  let num_cells = rows * cols in
  List.init num_cells (fun i -> Cell.create (i mod cols) (i / cols))


(**
 * create a grid with given dimension
 *)
let create rows cols =
  let cells = prepare rows cols in
  {rows; cols; cells}


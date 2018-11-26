(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module cell
 * A single cell
*)


type t = {
  row : int;
  column : int;
  mutable links : t Hashset.t
}

(**
 * Creates a cell for given position
*)
let create row col = {
  row = row;
  column = col;
  links = Hashset.create 64
}


(**
 * link two cell together
 *)
let link c1 c2 =
  Hashset.add c1.links c2;
  Hashset.add c2.links c1

(**
 * unlink two cells
 *)
let unlink c1 c2 =
  Hashset.remove c1.links c2;
  Hashset.remove c2.links c1

(**
 * predicate whether two cells are linked
 *)
let linkedp c1 c2 =
  Hashset.mem c1.links c2


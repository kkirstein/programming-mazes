(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module cell
 * A single cell
*)

type t = {
  row : int;
  col : int;
  mutable north : t option;
  mutable south : t option;
  mutable east : t option;
  mutable west : t option;
  mutable links : t Hashset.t
}

(**
 * Creates a cell for given position
*)
let create row col = {
  row; col;
  north = None; south = None; east = None; west = None;
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
let is_linked c1 c2 =
  Hashset.mem c1.links c2

(**
 * returns a list of linked cells
 *)
let links c =
  Hashset.fold (fun x acc -> x :: acc) c.links [] |>
  List.rev

(**
 * returns the linked neighbors
 *)
let neighbors c =
  [c.north; c.south; c.east; c.west] |>
  List.fold_left (fun acc x -> match x with Some c -> c :: acc | None -> acc) []



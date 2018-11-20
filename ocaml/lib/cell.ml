(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module cell
 * A single cell
*)


type t = {
  row : int;
  column : int;
  mutable links : t list
}

(**
 * Creates a cell for given position
*)
let create row col = {
  row = row;
  column = col;
  links = []
}


(**
 * link two cell together
 *)
let link ?(bidi=true) c1 c2 =
  c1.links <- c2 :: c1.links;
  c2.links <- c1 :: c2.links


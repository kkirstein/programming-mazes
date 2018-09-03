(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module grid
 * A data container to hold the cells of maze
 *)

type t = {
  cells : Cell.t list
}


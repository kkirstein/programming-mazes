(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module cell
 * A single cell
*)

type t = {
  row : int;
  column : int;
  links : t list
}



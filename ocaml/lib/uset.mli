(* vim: set ft=ocaml sw=2 ts=2 *)

(**
 * Module Uset
 * An unordered set. Its implementation is based on a list
 *)

type 'a t
(**
 * Abstract basic type
 *)

val empty : 'a t
(**
 * Returns an empty unordered set
*)

val from_list : 'a list -> 'a t
(**
 * Unordered set from given list
 *)

val add : 'a t -> 'a -> 'a t
(**
 * Adds an element to set. The set remains unchanged,
 * if the element is already present.
*)

val remove : 'a t -> 'a -> 'a t
(**
 * Removes an element from the set. The set remains unchanged,
 * if the element is not present
*)



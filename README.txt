# CSC454_Assignment_3
(*This work is done by Liu, Xiaochen and Feng, Ziqi*)

(*Part 1: translate the parse tree into a syntax tree, by Xiaochen*)
(*Part 2: walk the syntax tree to determine its behavior on a given input, by Ziqi and Xiaochen*)

Completed all basic requirements, but met issue when trying to declare in "do" scope. It may caused by wrong management of memory. To continue testing the interpreter, we modified some ECL code to declare variables as global variables.


Running guide:

ocaml
#load "str.cma";;
#use "interpreter.ml";;

(*test for ast_ize_prog*)
let parse_tree = parse ecg_parse_table primes_prog;;
(*
    or
    let parse_tree = parse ecg_parse_table gcd_prog;;
    let parse_tree = parse ecg_parse_table sum_ave_prog;;
    let parse_tree = parse ecg_parse_table sqrt_prog;;
*)
let ast = ast_ize_prog parse_tree;;
let () = pp_p ast;;

(* test for interpreter*)

interpret sum_ave_syntax_tree "4 6";;
(* should print "10 5" *)
 
interpret primes_syntax_tree "10";;
(* should print "2 3 5 7 11 13 17 19 23 29" *)

interpret sum_ave_syntax_tree "4 foo";;
(* should print " line 2, col 25: non-numeric input" *)

ecg_run "write 3 write 2 / 0" "";;
(* should print "3  line1, col 17: divide by zero" *)

ecg_run "write foo" "";;
(* should print " line 1, col 7: foo not found" *)

ecg_run "read int a read int b" "3";;
(* should print " line 1, col 21: unexpected end of input" *)

interpret sqrt_prog_syntax_tree "36.0";;
(* should print "5.99999999" *)

interpret gcd_syntax_tree "10 15";;
(* should print "5" *)

interpret float_trunc_syntax_tree "";;
(* should print "line 4, col 12:  line 0, col 0: Non-integer provided to float" *)
 

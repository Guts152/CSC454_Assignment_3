# CSC454_Assignment_3
(*This work is done by Liu, Xiaochen and Feng, Ziqi*)

(*Part 1: translate the parse tree into a syntax tree, by Xiaochen*)
(*Part 2: walk the syntax tree to determine its behavior on a given input, by Ziqi and Xiaochen*)

Completed all basic requirements.
We implemented some additional new functions to meet the requirement.
show_mem: function to show all declared variables in mem

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
    (* should print " line 1, col 24: Non-numeric input" *)
  
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
  
  interpret float_syntax_tree "";;
    (* should print "2.  line 5, col 12:  line 0, col 0: Non-integer provided to float" *)
  
  interpret trunc_syntax_tree "";;
  (* should print "lline 2, col 12: Type mismatch: trying to assign a real value to an integer variable" *)

(* below by xiaochen *)
 My part of the work is ast_ize
and some interpret_() mostly about loops: check if cond do
I write a rec function free_mem to free the memory by recursively calling end_scope to free the scope created during loops.
That best tells about functional style
Each loop epoch has a new scope. We have been thinking hard about how scope works.
It tooks us more than 40 hours to figure that out.

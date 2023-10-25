This work is done by Liu,Xiaochen and Feng,Ziqi

#load "str.cma";;
#use "interpreter_abridged.ml";;

(*Part 1: translate the parse tree into a syntax tree by Xiaochen*)
(*test for ast_ize_prog*)
let parse_tree = parse ecg_parse_table primes_prog;;
(*
    or
    let parse_tree = parse ecg_parse_table gcd_prog;;
    let parse_tree = parse ecg_parse_table sum_ave_prog;;
    let parse_tree = parse ecg_parse_table sqrt_prog;;
*)
let parse_tree = parse ecg_parse_table primes_prog;;

let parse_tree = parse ecg_parse_table gcd_prog;;
let ast = ast_ize_prog parse_tree;;
interpret ast "12 96";;

let () = pp_p ast;;

let parse_tree = parse ecg_parse_table sqrt_prog;;
let ast = ast_ize_prog parse_tree;;
interpret ast "81.0";;

let () = pp_p ast;;

let main () =

  print_string (interpret sum_ave_syntax_tree "4 6");
    (* should print "10 5" *)
  print_newline ();
  print_string (interpret primes_syntax_tree "10");
    (* should print "2 3 5 7 11 13 17 19 23 29" *)
  print_newline ();
  print_string (interpret sum_ave_syntax_tree "4 foo");
    (* should print " line 2, col 25: non-numeric input" *)
  print_newline ();
  print_string (ecg_run "write 3 write 2 / 0" "");
    (* should print "3  line1, col 17: divide by zero" *)
  print_newline ();
  print_string (ecg_run "write foo" "");
    (* should print " line 1, col 7: foo not found" *)
  print_newline ();
  print_string (ecg_run "read int a read int b" "3");
    (* should print " line 1, col 21: unexpected end of input" *)
  print_newline ();

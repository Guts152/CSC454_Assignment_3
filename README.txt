# CSC454_Assignment_3
(*This work is done by Liu,Xiaochen and Feng,Ziqi*)

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
let ast = ast_ize_prog parse_tree;;
let () = pp_p ast;;



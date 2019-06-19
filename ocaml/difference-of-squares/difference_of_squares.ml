(* Square the sum of the numbers up to the given number
val square_of_sum : int -> int

(* Sum the squares of the numbers up to the given number *)
val sum_of_squares : int -> int

(* Subtract sum of squares from square of sums *)
val difference_of_squares : int -> int
*)

let pow n m = int_of_float (float_of_int n ** float_of_int m)

let range n = List.init n ((+) 1)

let sum = List.fold_left (+) 0

let square_of_sum n =
  pow (sum (range n)) 2

let sum_of_squares n =
  sum (List.map (fun x -> pow x 2) (range n))

let difference_of_squares n =
  square_of_sum n - sum_of_squares n

fun concat (lists : int list list) : int list =
  case lists of
    [] => []
  | ([]::ys) => concat ys
  | ((x::xs)::ys) => x :: concat (xs::ys)

fun reverse ([] : int list) : int list = []
  | reverse (x::xs) = reverse xs @ [x]

fun filter (p : int -> bool, [] : int list) : int list = []
  | filter (p, (x::xs)) =
      if p x
      then x :: filter (p, xs)
      else filter (p, xs)

fun map (f : int -> int, [] : int list) : int list = []
  | map (f, (x::xs)) = f x :: map (f, xs)

fun append (list1 : int list, list2 : int list) : int list =
  case list1 of
    [] => list2
  | (x::xs) => x :: append(xs, list2)

fun length ([] : int list) : int = 0
  | length (x::xs) = 1 + length xs

fun foldl (f : int * int -> int, initial : int, xss : int list) : int =
  case xss of
    [] => initial
  | (x::xs) => foldl (f, (f (initial, x)), xs)

fun foldr (f : int * int -> int, initial : int, xss : int list): int =
  case xss of
    [] => initial
  | (x::xs) => f (x, (foldr (f, initial, xs)))

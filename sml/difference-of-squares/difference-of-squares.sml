fun sum (xs : int list) : int =
  foldr (fn (x,z) => x + z) 0 xs;

fun square (n : int) : int = n * n;
fun range (n : int) : int list =
  List.tabulate(n, fn x => x+1)

fun squareOfSum (n : int) : int =
  let val res = sum (range n)
  in square res
  end

fun sumOfSquares (n : int) : int =
  sum (map square (range n))

fun differenceOfSquares (n : int) : int =
  squareOfSum n - sumOfSquares n

fun aux acc 1 = acc
  | aux acc n =
    if n mod 2 = 0 then aux (acc+1) (n div 2)
    else aux (acc+1) (3*n + 1)

fun collatz n =
  if n <= 0 then NONE
  else SOME (aux 0 n)

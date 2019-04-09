fun accumulate (_, []) = []
  | accumulate (f, (x::xs)) = f x :: accumulate (f, xs)

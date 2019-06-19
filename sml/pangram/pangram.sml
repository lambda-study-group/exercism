fun nub [] = []
  | nub (x::xs) = x :: nub (List.filter (fn y => x <> y) xs)

fun isPangram s =
  let val chars = List.filter Char.isAlpha (map Char.toLower (explode s))
  in length (nub chars) >= 26
  end

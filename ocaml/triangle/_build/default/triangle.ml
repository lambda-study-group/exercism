let is_valid x y z = 
  match (x, y, z) with
  | (0, _, _) -> false
  | (_, 0, _) -> false
  | (_, _, 0) -> false
  | (x, y, z) -> x + y > z && x + z > y && y + z > x

type triangle =
  | Illegal
  | Equilateral
  | Scalene
  | Isosceles

let triangleType x y z =
  match (x, y, z) with
  | (x, y, z) when not (is_valid x y z) -> Illegal
  | (x, y, z) when
    x = y && x = z && y = z && is_valid x y z ->
      Equilateral
  | (x, y, z) when
    x <> y && x <> z && y <> z && is_valid x y z ->
      Scalene
  | _ -> Isosceles

let is_equilateral x y z =
  triangleType x y z = Equilateral

let is_isosceles x y z =
  triangleType x y z = Isosceles
  || triangleType x y z = Equilateral

let is_scalene x y z =
  triangleType x y z = Scalene

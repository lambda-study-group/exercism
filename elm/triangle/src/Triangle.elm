module Triangle exposing (Triangle(..), triangleKind)

import Set


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


isTriangle : number -> number -> number -> Bool
isTriangle x y z =
    x > 0 && y > 0 && z > 0


followsTriangleInequality : number -> number -> number -> Bool
followsTriangleInequality x y z =
    x + y >= z && x + z >= y && y + z >= x


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    if not (isTriangle x y z) then
        Err "Invalid lengths"

    else if not (followsTriangleInequality x y z) then
        Err "Violates inequality"

    else
        case [ x, y, z ] |> Set.fromList |> Set.size of
            1 ->
                Ok Equilateral

            2 ->
                Ok Isosceles

            _ ->
                Ok Scalene

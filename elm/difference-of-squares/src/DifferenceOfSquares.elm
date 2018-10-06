module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


oneToN : Int -> List Int
oneToN = List.range 1


squareOfSum : Int -> Int
squareOfSum n = (oneToN n |> List.sum)^2


sumOfSquares : Int -> Int
sumOfSquares n = 
    oneToN n
    |> List.foldr (\x acc -> acc + x^2) 0


difference : Int -> Int
difference n = squareOfSum n - sumOfSquares n

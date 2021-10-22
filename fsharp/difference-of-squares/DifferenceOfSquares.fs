module DifferenceOfSquares

let squareOfSum (number: int): int = 
    (fun x -> x*x)([1..number] |> List.sum)

let sumOfSquares (number: int): int = 
    [1..number] |> List.map (fun x -> x*x) |> List.sum

let differenceOfSquares (number: int): int = 
    squareOfSum number - sumOfSquares number
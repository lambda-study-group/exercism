module SumOfMultiples

let sum (numbers: int list) (upperBound: int): int = 
    [1..(upperBound-1)] 
    |> List.filter (fun x -> List.exists (fun y -> y <> 0 && (x % y) = 0) numbers) 
    |> List.sum
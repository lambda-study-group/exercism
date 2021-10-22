module ArmstrongNumbers

let sumDigits n =
    let digits = List.unfold (fun x ->
                    if x = 0 then None
                    else Some(x%10, x/10)) n
    let nDigits = List.length digits
    digits |> List.map (fun x -> float(x)**float(nDigits)) |> List.sum |> int                    

let isArmstrongNumber (number: int): bool = 
    number = (sumDigits number)
module Raindrops

let convert (number: int): string = 
    let sb = System.Text.StringBuilder()
    if number % 3 = 0 then sb.Append("Pling") |> ignore
    if number % 5 = 0 then sb.Append("Plang") |> ignore
    if number % 7 = 0 then sb.Append("Plong") |> ignore
    if sb.Length = 0 then sb.Append(number) |> ignore
    sb.ToString()

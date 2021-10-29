module Leap

let leapYear (year: int): bool = 
    match year with
    | y when y % 400 = 0 -> true
    | y when y % 100 = 0 -> false
    | y when y % 4 = 0 -> true
    | _ -> false
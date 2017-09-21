module Leap exposing (..)


isLeapYear : Int -> Bool
isLeapYear year =
    if divBy4 year && not (divBy100 year) || divBy400 year then
        True
    else
        False


divisible : Int -> Int -> Bool
divisible divisor year =
    rem year divisor == 0


divBy4 : Int -> Bool
divBy4 =
    divisible 4


divBy100 : Int -> Bool
divBy100 =
    divisible 100


divBy400 : Int -> Bool
divBy400 =
    divisible 400
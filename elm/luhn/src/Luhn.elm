module Luhn exposing (valid)

import Char exposing (isDigit)
import List exposing (filterMap, indexedMap, length, reverse, sum)
import String exposing (all, split, toInt)


applyLuhnsSecondDigitMap : List Int -> List Int
applyLuhnsSecondDigitMap xs =
    xs
        |> reverse
        |> indexedMap (applyOnSecondDigits doubleAndSubtractNine)
        |> reverse


applyOnSecondDigits : (Int -> Int) -> Int -> Int -> Int
applyOnSecondDigits f index x =
    if not (isEven index) then
        f x

    else
        x


canApplyLuhnsFormula : String -> Bool
canApplyLuhnsFormula s =
    length (toIntList s) > 1 && all isDigitOrSpace s


doubleAndSubtractNine : Int -> Int
doubleAndSubtractNine x =
    let
        doubled =
            x * 2
    in
    if doubled > 9 then
        doubled - 9

    else
        doubled


isDigitOrSpace : Char -> Bool
isDigitOrSpace c =
    isDigit c || c == ' '


isEven : Int -> Bool
isEven x =
    remainderBy 2 x == 0


toIntList : String -> List Int
toIntList s =
    s |> split "" |> filterMap toInt


valid : String -> Bool
valid input =
    if canApplyLuhnsFormula input then
        input
            |> toIntList
            |> applyLuhnsSecondDigitMap
            |> sum
            |> remainderBy 10
            |> (==) 0

    else
        False

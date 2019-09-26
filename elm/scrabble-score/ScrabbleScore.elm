module ScrabbleScore exposing (scoreWord)

import List exposing (member)


scoreLetter : Char -> Int
scoreLetter letter =
    let
        upperLetter =
            Char.toUpper letter
    in
    if member upperLetter [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ] then
        1

    else if member upperLetter [ 'D', 'G' ] then
        2

    else if member upperLetter [ 'B', 'C', 'M', 'P' ] then
        3

    else if member upperLetter [ 'F', 'H', 'V', 'W', 'Y' ] then
        4

    else if upperLetter == 'K' then
        5

    else if member upperLetter [ 'J', 'X' ] then
        8

    else if member upperLetter [ 'Q', 'Z' ] then
        10

    else
        0


scoreWord : String -> Int
scoreWord x =
    String.toList x
        |> List.map scoreLetter
        |> List.sum

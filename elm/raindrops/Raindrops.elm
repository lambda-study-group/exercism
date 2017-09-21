module Raindrops exposing (..)

import List exposing (reverse, head, foldr, range, filter)


raindrops : Int -> String
raindrops n =
    let
        digitFactor =
            isFactor n
    in
        range 1 n
            |> filter digitFactor
            |> plingify


isFactor : Int -> Int -> Bool
isFactor n factor =
    if factor % n == 0 then True else False


plingify : List Int -> String
plingify factors =
    let
        plings =
          foldr (\(a, b) acc ->
           then b :: acc else acc) [] cases
    in
        if plings == "" then
            factors |> reverse |> head |> toString
        else
            plings


cases : List ( number, String )
cases =
    [ ( 3, "Pling" )
    , ( 5, "Plang" )
    , ( 7, "Plong" )
    ]

module Grains exposing (square)


square : Int -> Maybe Int
square n =
    if n > 0 then
        Just (square_ (n - 1) 1)

    else
        Nothing


square_ : Int -> Int -> Int
square_ n count =
    if n > 0 then
        square_ (n - 1) (count * 2)

    else
        count

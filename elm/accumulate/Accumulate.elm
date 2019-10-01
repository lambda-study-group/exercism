module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func input =
    case input of
        [] ->
            []

        x :: xs ->
            func x :: accumulate func xs

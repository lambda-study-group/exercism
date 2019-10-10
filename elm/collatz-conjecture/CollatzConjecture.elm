module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start > 0 then
        Ok <| collatzStep 0 start

    else
        Err "Only positive numbers are allowed"


collatzStep : Int -> Int -> Int
collatzStep step n =
    case n of
        1 ->
            step

        _ ->
            let
                newN =
                    if modBy 2 n == 0 then
                        n // 2

                    else
                        (n * 3) + 1
            in
            collatzStep (step + 1) newN

module Tests exposing (tests)

import CollatzConjecture exposing (collatz)
import Expect
import Test exposing (..)


tests : Test
tests =
    describe "CollatzConjecture tests"
        [ test "zero steps for one" <|
            \() ->
                Expect.equal (Ok 0) (collatz 1)

        -- Once you get the first test passing, remove the
        -- `skip <|` (just leave the comma) on the next
        -- lines to continue!
        , test "divide if even" <|
            \() ->
                Expect.equal (Ok 4) (collatz 16)
        , test "even and odd step" <|
            \() ->
                Expect.equal (Ok 9) (collatz 12)
        , test "Large number of even and odd step" <|
            \() ->
                Expect.equal (Ok 152) (collatz 1000000)
        , test "zero is an error" <|
            \() ->
                Expect.equal (Err "Only positive numbers are allowed") (collatz 0)
        , test "negative values is an error" <|
            \() ->
                Expect.equal (Err "Only positive numbers are allowed") (collatz -15)
        ]

(* version 1.1.1 *)

use "testlib.sml";
use "collatz-conjecture.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "collatz-conjecture" [
    test "zero collatz for one"
      (fn _ => collatz (1) |> Expect.equalTo (SOME 0)),

    test "divide if even"
      (fn _ => collatz (16) |> Expect.equalTo (SOME 4)),

    test "even and odd collatz"
      (fn _ => collatz (12) |> Expect.equalTo (SOME 9)),

    test "Large number of even and odd collatz"
      (fn _ => collatz (1000000) |> Expect.equalTo (SOME 152)),

    test "zero is an error"
      (fn _ => collatz (0) |> Expect.equalTo NONE),

    test "negative value is an error"
      (fn _ => collatz (~15) |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite

(* version 1.4.0 *)

use "testlib.sml";
use "leap.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "leap" [
    test "year not divisible by 4: common year"
      (fn _ => isLeapYear (2015) |> Expect.falsy),

    test "year divisible by 4, not divisible by 100: leap year"
      (fn _ => isLeapYear (1996) |> Expect.truthy),

    test "year divisible by 100, not divisible by 400: common year"
      (fn _ => isLeapYear (2100) |> Expect.falsy),

    test "year divisible by 400: leap year"
      (fn _ => isLeapYear (2000) |> Expect.truthy),

    test "year divisible by 200, not divisible by 400: common year"
      (fn _ => isLeapYear (1800) |> Expect.falsy)
  ]

val _ = Test.run testsuite

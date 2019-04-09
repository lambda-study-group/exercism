(* version 1.1.0 *)

use "pangram.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pangram" [
    describe "Check if the given string is an pangram" [
      test "sentence empty"
        (fn _ => isPangram ("") |> Expect.falsy),

      test "pangram with only lower case"
        (fn _ => isPangram ("the quick brown fox jumps over the lazy dog") |> Expect.truthy),

      test "missing character 'x'"
        (fn _ => isPangram ("a quick movement of the enemy will jeopardize five gunboats") |> Expect.falsy),

      test "another missing character 'x'"
        (fn _ => isPangram ("the quick brown fish jumps over the lazy dog") |> Expect.falsy),

      test "pangram with underscores"
        (fn _ => isPangram ("the_quick_brown_fox_jumps_over_the_lazy_dog") |> Expect.truthy),

      test "pangram with numbers"
        (fn _ => isPangram ("the 1 quick brown fox jumps over the 2 lazy dogs") |> Expect.truthy),

      test "missing letters replaced by numbers"
        (fn _ => isPangram ("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog") |> Expect.falsy),

      test "pangram with mixed case and punctuation"
        (fn _ => isPangram ("\"Five quacking Zephyrs jolt my wax bed.\"") |> Expect.truthy),

      test "upper and lower case versions of the same character should not be counted separately"
        (fn _ => isPangram ("the quick brown fox jumps over with lazy FX") |> Expect.falsy)
    ]
  ]

val _ = Test.run testsuite

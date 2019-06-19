(* version 1.0.0 *)

use "hello-world.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "hello-world" [
    test "Say Hi!"
      (fn _ => hello () |> Expect.equalTo "Hello, World!")
  ]

val _ = Test.run testsuite
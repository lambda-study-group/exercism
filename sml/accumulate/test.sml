use "accumulate.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "accumulate" [
    test "applying a function to the empty-list does nothing"
      (fn _ => accumulate (fn x => x, []) |> Expect.equalTo []),

    test "applying an identify function to any list returns the source list"
      (fn _ => accumulate (fn x => x, [1,2,3]) |> Expect.equalTo [1,2,3]),

    test "applying a square function to [1,2,3] produces [1,4,9]"
      (fn _ => accumulate (fn x => x * x, [1,2,3]) |> Expect.equalTo [1,4,9]),

    test "applying a cube function to [1,2,3] produces [1,8,27]"
      (fn _ => accumulate (fn x => x * x * x, [1,2,3]) |> Expect.equalTo [1,8,27]),

    test "applying an increment function to [1,2,3] produces [2,3,4]"
      (fn _ => accumulate (fn x => x + 1, [1,2,3]) |> Expect.equalTo [2,3,4]),

    test "applying an decrement function to [1,2,3] produces [0,1,2]"
      (fn _ => accumulate (fn x => x - 1, [1,2,3]) |> Expect.equalTo [0,1,2])
  ]

val _ = Test.run testsuite
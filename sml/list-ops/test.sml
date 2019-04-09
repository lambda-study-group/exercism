(* version 2.0.0 *)

use "testlib.sml";
use "list-ops.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "list-ops" [
    describe "append entries to a list and return the new list" [
      test "empty lists"
        (fn _ => append ([], []) |> Expect.equalTo []),

      test "empty list to list"
        (fn _ => append ([], [1, 2, 3, 4]) |> Expect.equalTo [1, 2, 3, 4]),

      test "non-empty lists"
        (fn _ => append ([1, 2], [2, 3, 4, 5]) |> Expect.equalTo [1, 2, 2, 3, 4, 5])
    ],

    describe "concat lists and lists of list into a new list" [
      test "empty list"
        (fn _ => concat ([]) |> Expect.equalTo []),

      test "list of lists"
        (fn _ => concat ([[1, 2], [3], [], [4, 5, 6]]) |> Expect.equalTo [1, 2, 3, 4, 5, 6])
    ],

    describe "filter list returning only values that satisfy the filter function" [
      test "empty list"
        (fn _ => filter (fn n => n mod 2 = 1, []) |> Expect.equalTo []),

      test "non-empty list"
        (fn _ => filter (fn n => n mod 2 = 1, [1, 2, 3, 5]) |> Expect.equalTo [1, 3, 5])
    ],

    describe "returns the length of a list" [
      test "empty list"
        (fn _ => length ([]) |> Expect.equalTo 0),

      test "non-empty list"
        (fn _ => length ([1, 2, 3, 4]) |> Expect.equalTo 4)
    ],

    describe "return a list of elements whos values equal the list value transformed by the mapping function" [
      test "empty list"
        (fn _ => map (fn n => n + 1, []) |> Expect.equalTo []),

      test "non-empty list"
        (fn _ => map (fn n => n + 1, [1, 3, 5, 7]) |> Expect.equalTo [2, 4, 6, 8])
    ],

    describe "folds (reduces) the given list from the left with a function" [
      test "empty list"
        (fn _ => foldl (fn (x, y) => x * y, 2, []) |> Expect.equalTo 2),

      test "direction independent function applied to non-empty list"
        (fn _ => foldl (fn (x, y) => x + y, 5, [1, 2, 3, 4]) |> Expect.equalTo 15),

      test "direction dependent function applied to non-empty list"
        (fn _ => foldl (fn (x, y) => x div y, 5, [2, 5]) |> Expect.equalTo 0)
    ],

    describe "folds (reduces) the given list from the right with a function" [
      test "empty list"
        (fn _ => foldr (fn (x, y) => x * y, 2, []) |> Expect.equalTo 2),

      test "direction independent function applied to non-empty list"
        (fn _ => foldr (fn (x, y) => x + y, 5, [1, 2, 3, 4]) |> Expect.equalTo 15),

      test "direction dependent function applied to non-empty list"
        (fn _ => foldr (fn (x, y) => x div y, 5, [2, 5]) |> Expect.equalTo 2)
    ],

    describe "reverse the elements of the list" [
      test "empty list"
        (fn _ => reverse ([]) |> Expect.equalTo []),

      test "non-empty list"
        (fn _ => reverse ([1, 3, 5, 7]) |> Expect.equalTo [7, 5, 3, 1])
    ]
  ]

val _ = Test.run testsuite

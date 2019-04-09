(* version 1.1.0 *)

use "difference-of-squares.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "difference-of-squares" [
    describe "Square the sum of the numbers up to the given number" [
      test "square of sum 1"
        (fn _ => squareOfSum (1) |> Expect.equalTo 1),

      test "square of sum 5"
        (fn _ => squareOfSum (5) |> Expect.equalTo 225),

      test "square of sum 100"
        (fn _ => squareOfSum (100) |> Expect.equalTo 25502500)
    ],

    describe "Sum the squares of the numbers up to the given number" [
      test "sum of squares 1"
        (fn _ => sumOfSquares (1) |> Expect.equalTo 1),

      test "sum of squares 5"
        (fn _ => sumOfSquares (5) |> Expect.equalTo 55),

      test "sum of squares 100"
        (fn _ => sumOfSquares (100) |> Expect.equalTo 338350)
    ],

    describe "Subtract sum of squares from square of sums" [
      test "difference of squares 1"
        (fn _ => differenceOfSquares (1) |> Expect.equalTo 0),

      test "difference of squares 5"
        (fn _ => differenceOfSquares (5) |> Expect.equalTo 170),

      test "difference of squares 100"
        (fn _ => differenceOfSquares (100) |> Expect.equalTo 25164150)
    ]
  ]

val _ = Test.run testsuite